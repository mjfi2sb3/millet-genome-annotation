#!/usr/bin/env python3
#
#
import collections
import matplotlib.pyplot as plt
import numpy as np

# Define a function to create the plot for a given input file
def plot_gene_length_distribution(input_file, subplot_position, title, color):
    data = []  # Assuming each row is (gene_length, count)
    with open(input_file, 'r') as file:
        for line in file:
            gene_length, count = map(int, line.strip().split('\t'))
            data.append((gene_length, count))

    # Define bin size
    bin_size = 1000

    # Create bins
    bins = collections.defaultdict(int)

    # Populate bins
    print(f"***** {input_file}")

    for gene_length, count in data:
        bin_start = ((gene_length // bin_size)+1) * bin_size
        bins[bin_start] += count

    print(bins)
    # Extract bin start positions and counts
    bin_starts = sorted(bins.keys())
    counts = [bins[bin_start] for bin_start in bin_starts]

    # Calculate the log10 of gene length
    log_gene_length = np.log10(bin_starts)
    count_reformat = [x/1000 for x in counts]

    # Plot the data in a separate subplot
    plt.subplot(1, 2, subplot_position)  # 1 row, 2 columns, subplot_position indicates which panel

    plt.bar(log_gene_length, count_reformat, width=0.1, align='edge', color=color)
    plt.xlabel('Gene Length (Log$_{10}$ )')
    plt.ylabel('Count $_{(x1000)}$')
    plt.title(title)

    # Set the same y-axis limits for both subplots
    plt.ylim([0, 12])  # Adjust the upper limit if needed

    # Add grid lines for better readability
    plt.grid(axis='y', linestyle='--', alpha=0.7)

# Define the input files, titles, and colors
input_files = ['p10_gene_len.tsv', 'aw_gene_len.tsv']
titles = ['P10 - HC Gene Length Distribution', 'Aw - HC Gene Length Distribution']
colors = ['skyblue', 'lightcoral']

# Create a figure with two subplots
plt.figure(figsize=(14, 6))  # Adjust the figure size

# Plot each input file in a separate panel
for i, (input_file, title, color) in enumerate(zip(input_files, titles, colors), start=1):
    plot_gene_length_distribution(input_file, i, title, color)

# Adjust the spacing between subplots
plt.tight_layout()

## Set a single y-label for both panels
#plt.ylabel('Count (x1000)')


# Save the entire figure as a PDF file
plt.savefig('gene_length_distribution_combined.pdf', format='pdf')

# Show the figure (optional)
#plt.show()
