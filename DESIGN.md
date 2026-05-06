---
name: PosterMaker
description: A high-visual, code-driven factory for professional cheatsheets.
colors:
  primary: "#1A1A1A"    # Deep Charcoal for titles
  secondary: "#333333"  # Soft Black for body text
  accent: "#3B82F6"     # Modern Blue for core components
  neutral: "#FAFAFA"    # Warm White background
  danger: "#F87171"     # Incident/Warning Red
  info: "#06B6D4"       # Cyan for highlights
typography:
  h1:
    fontFamily: Adwaita Sans
    fontSize: 32pt
    fontWeight: bold
  body-md:
    fontFamily: Adwaita Sans
    fontSize: 10pt
  label-caps:
    fontFamily: Adwaita Sans
    fontSize: 11pt
    fontWeight: bold
rounded:
  sm: 4px
spacing:
  margin: 1.5cm
  gutter: 1cm
components:
  section-box:
    backgroundColor: "{colors.neutral}"
    textColor: "{colors.secondary}"
    rounded: "{rounded.sm}"
  header-block:
    backgroundColor: "{colors.accent}"
    textColor: "#FFFFFF"
---

## Overview

The PosterMaker aesthetic is built on **Grid-Based Precision** and **Visual Hierarchy**. It is designed to be "Journalistically Dense"—meaning it packs a lot of information without feeling cluttered, using clear borders and generous white space.

## Colors

The palette is rooted in a neutral foundation to allow the content to breathe.

- **Primary (#1A1A1A):** Used for main headings to provide strong visual anchoring.
- **Accent (#3B82F6):** The primary color for interaction and section categorization.
- **Neutral (#FAFAFA):** A warm limestone background that is easier on the eyes than pure white.

## Typography

We prioritize readability across all device sizes and print formats.

- **H1:** Large and bold to define the poster's subject instantly.
- **Body:** Sized for high information density while maintaining legibility.
- **Label:** Bold variants used for section headers to guide the eye.

## Layout

The system uses an A3 Grid (3 columns by default) to maximize the available surface area for complex AI workflows.

- **Margin:** 1.5cm safe zone for professional printing.
- **Gutter:** 1cm spacing between columns to prevent visual bleeding.

## Components

- **Section Box:** The atomic unit of the layout. Every box is self-contained with its own header and body.
- **Level Badge:** A specialized component for AI recipes to denote "Babysitting" difficulty.
- **Step Node:** A minimalist block used for sequence flowcharts.
