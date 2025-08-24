#include <iostream>
#include <vector>
#include <bitset>
#include <algorithm>
#include <tuple>

// Function to compute the Morton Code by interleaving the bits of x, y, and z
unsigned int mortonCode(int x, int y, int z) {
    unsigned int morton = 0;
    for (int i = 0; i < 4; i++) {
        morton |= ((x >> i) & 1) << (3 * i);
        morton |= ((y >> i) & 1) << (3 * i + 1);
        morton |= ((z >> i) & 1) << (3 * i + 2);
    }
    return morton;
}

// Extract consecutive bits from morton code
unsigned int extractRowBits(unsigned int morton, int start_bit, int num_bits) {
    unsigned int mask = (1u << num_bits) - 1;  // Create mask with num_bits ones
    return (morton >> start_bit) & mask;
}

struct RowConfig {
    int start_bit;
    int num_bits;
    int neighbors_in_same_row;
    
    void print() const {
        std::cout << num_bits << " bits starting at bit " << start_bit 
                  << " (bits ";
        for (int i = 0; i < num_bits; i++) {
            std::cout << (start_bit + i);
            if (i < num_bits - 1) std::cout << ",";
        }
        std::cout << "): " << neighbors_in_same_row << " neighbors in same row\n";
    }
};

#ifndef HLS_TESTBENCH
int main() {
    int x_center, y_center, z_center;
    std::cout << "Enter center voxel coordinates (x, y, z): ";
    std::cin >> x_center >> y_center >> z_center;
    
    // Vector to store (morton code, coordinates) of each voxel
    std::vector<std::pair<unsigned int, std::tuple<int, int, int>>> voxel_data;
    
    // Generate 3x3x3 neighborhood
    for (int dx = -3; dx <= 3; dx++) {
        for (int dy = -3; dy <= 3; dy++) {
            for (int dz = -3; dz <= 3; dz++) {
                int x = x_center + dx;
                int y = y_center + dy;
                int z = z_center + dz;
                unsigned int morton = mortonCode(x, y, z);
                voxel_data.push_back({morton, std::make_tuple(x, y, z)});
            }
        }
    }
    
    // Output in coordinate order (as generated)
    std::cout << "\nCoordinates in original order:\n";
    for (const auto& entry : voxel_data) {
        unsigned int morton = entry.first;
        int x, y, z;
        std::tie(x, y, z) = entry.second;
        std::cout << "Voxel (" << x << ", " << y << ", " << z << ") -> "
                  << "Morton Binary: " << std::bitset<12>(morton) << " "
                  << "Morton Decimal: " << morton << "\n";
    }
    
    // Create sorted copy for display
    auto sorted_voxel_data = voxel_data;
    std::sort(sorted_voxel_data.begin(), sorted_voxel_data.end(),
        [](const auto& a, const auto& b) {
            return a.first < b.first;
        });
    
    // Output sorted by morton code
    std::cout << "\nCoordinates sorted by Morton code:\n";
    for (const auto& entry : sorted_voxel_data) {
        unsigned int morton = entry.first;
        int x, y, z;
        std::tie(x, y, z) = entry.second;
        std::cout << "Voxel (" << x << ", " << y << ", " << z << ") -> "
                  << "Morton Binary: " << std::bitset<12>(morton) << " "
                  << "Morton Decimal: " << morton << "\n";
    }
    
    // Find center voxel morton code
    unsigned int center_morton = mortonCode(x_center, y_center, z_center);
    
    std::cout << "\nCenter voxel morton code: " << center_morton 
              << " (binary: " << std::bitset<12>(center_morton) << ")\n";
    
    // Test all possible consecutive bit configurations
    std::vector<RowConfig> results;
    
    // Test 1 bit through 11 bits (can't use all 12 bits as that would be identical grouping)
    for (int num_bits = 1; num_bits < 12; num_bits++) {
        // Test all possible starting positions for this number of bits
        for (int start_bit = 0; start_bit <= 12 - num_bits; start_bit++) {
            
            // Extract row bits for center voxel
            unsigned int center_row = extractRowBits(center_morton, start_bit, num_bits);
            
            // Count neighbors in same row (excluding center itself)
            int neighbors_in_same_row = 0;
            for (const auto& entry : voxel_data) {
                int x, y, z;
                std::tie(x, y, z) = entry.second;
                
                // Skip center voxel itself
                if (x == x_center && y == y_center && z == z_center) continue;
                
                unsigned int neighbor_row = extractRowBits(entry.first, start_bit, num_bits);
                if (neighbor_row == center_row) {
                    neighbors_in_same_row++;
                }
            }
            
            RowConfig config;
            config.start_bit = start_bit;
            config.num_bits = num_bits;
            config.neighbors_in_same_row = neighbors_in_same_row;
            results.push_back(config);
        }
    }
    
    // Sort results by number of neighbors in same row (descending), 
    // then by number of bits used (descending) as tiebreaker
    std::sort(results.begin(), results.end(),
        [](const RowConfig& a, const RowConfig& b) {
            if (a.neighbors_in_same_row != b.neighbors_in_same_row) {
                return a.neighbors_in_same_row > b.neighbors_in_same_row;
            }
            // If same number of neighbors, prefer more bits
            return a.num_bits > b.num_bits;
        });
    
    // Output all results
    std::cout << "\nAll row bit configurations ranked by neighbors in same row:\n";
    std::cout << "(Ties broken by preferring more bits)\n";
    std::cout << "========================================================\n";
    
    for (const auto& config : results) {
        config.print();
    }
    
    // Show detailed breakdown for the best configuration
    if (!results.empty()) {
        const RowConfig& best = results[0];
        std::cout << "\nDetailed analysis of best configuration:\n";
        std::cout << "Using " << best.num_bits << " bits starting at bit " << best.start_bit << "\n";
        
        unsigned int center_row = extractRowBits(center_morton, best.start_bit, best.num_bits);
        std::cout << "Center voxel row value: " << center_row << "\n";
        std::cout << "Neighbors in same row:\n";
        
        for (const auto& entry : voxel_data) {
            int x, y, z;
            std::tie(x, y, z) = entry.second;
            
            if (x == x_center && y == y_center && z == z_center) continue;
            
            unsigned int neighbor_row = extractRowBits(entry.first, best.start_bit, best.num_bits);
            if (neighbor_row == center_row) {
                std::cout << "  Voxel (" << x << ", " << y << ", " << z 
                          << ") row value: " << neighbor_row << "\n";
            }
        }
    }
    
    return 0;
}
#endif