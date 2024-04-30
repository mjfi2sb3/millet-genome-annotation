#!/usr/bin/env python
import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt
import numpy as np

# Load data
df = pd.read_excel("cov_ratio_labels_edit.xlsx")

# Color palette
color_palette = sns.color_palette("dark", n_colors=len(df["Biological Status"].unique()))

# Log10 transformation
df["Log_Ratio"] = np.log10(df["Ratio"])

# Set Seaborn style and palette
sns.set(style="whitegrid")
sns.set_palette(color_palette)

# Figure size
plt.figure(figsize=(16, 6))

# Scatterplot with hue and style
ax = sns.scatterplot(
    x="Lib Name",
    y="Log_Ratio",
    hue="Biological Status",
    style="Region",
    data=df,
    edgecolor="w",
    s=60,
)

# Extract handles and labels
handles, labels = ax.get_legend_handles_labels()

# Separate by category
bio_status_handles = []
bio_status_labels = []
region_handles = []
region_labels = []

myFlag=False
for i, label in enumerate(labels):
    if label.startswith("Biological Status"):
        myFlag=True
        continue
    elif label.startswith("Region"):
        myFlag=False
        continue
       
    if myFlag:
        bio_status_handles.append(handles[i])
        bio_status_labels.append(label)
        print(f'Biological Status: {label}')
    else:
        region_handles.append(handles[i])
        region_labels.append(label)
        print(f'Region: {label}')

# Define legend positions and titles
bio_leg_pos = (0.5, -0.3)
bio_leg_title = "Biological Status"
region_leg_pos = (0.5, -0.3)
region_leg_title = "Region"

# Create and add separate legends
bio_leg = ax.legend(
    title=bio_leg_title,
    loc="lower left",
    ncol=2,
    bbox_to_anchor=bio_leg_pos,
    handles=bio_status_handles,
    labels=bio_status_labels,
    fontsize="8",
)
region_leg = ax.legend(
    title=region_leg_title,
    loc="lower right",
    ncol=2,
    bbox_to_anchor=region_leg_pos,
    handles=region_handles,
    labels=region_labels,
    fontsize="8",
)

# Add artist to ensure legend is drawn
ax.add_artist(bio_leg)
ax.add_artist(region_leg)
ax.spines['bottom'].set_color('black')
ax.spines['left'].set_color('black')
# Make x and y axes solid black
#plt.axhline(y=0, color='black', linewidth=1)  # For x-axis
#plt.axvline(x=0, color='black', linewidth=1)  # For y-axis

# Remaining plot customizations
plt.xlabel("Samples", fontsize=12)
plt.ylabel("Coverage Ratio ($\log_{10}$)", fontsize=12)
plt.grid(axis="y", linestyle="--", alpha=0.6)
plt.tick_params(axis="both", which="both", labelsize=10)
plt.xticks([])
sns.despine()

# Save and show plot
plt.savefig("cov_plot_p10.pdf", bbox_inches="tight")
plt.savefig("cov_plot_p10.svg", format="svg", bbox_inches="tight")
# Show the plot
#plt.show()


"""
#### no log10
import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt

# Load data from Excel file (replace 'cov_ratio.xlsx' with your actual file)
df = pd.read_excel('cov_ratio_labels_edit.xlsx')

# Use Seaborn's colorblind-friendly palette
color_palette = sns.color_palette('colorblind')

# Create a scatterplot with hue (color) and style (shape) based on the 'Info' and 'Country Source' columns
#sns.scatterplot(x='Lib Name', y='Ratio', hue='Info', style='Country Source', data=df)
#sns.scatterplot(x='Lib Name', y='Ratio', hue='Region', style='Info', data=df)
sns.scatterplot(x='Lib Name', y='Ratio', hue='Biological Status', style='Info', data=df)


# Customize the plot
plt.title('Coverage Ratio by Biological Status and Category')
plt.xlabel('Samples')
plt.ylabel('Coverage Ratio (P10_Pg2 / ROI)')

# Move legend outside of the plot area
plt.legend(bbox_to_anchor=(1, 1), loc='upper left')

# Hide x-axis labels
plt.xticks([])

# Show the plot
plt.show()
"""
