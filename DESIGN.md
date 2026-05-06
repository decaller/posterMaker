---
name: Claude-Midnight-Botanical
version: 1.0.0
description: A high-craft, "Living Dark" editorial system. Inspired by the quiet focus of a midnight conservatory.

# Colors (OKLCH Strategy: Committed)
# Laws: Neutrals are tinted with primary hue (h: 145) at c: 0.01
colors:
  primary: "oklch(55% 0.08 145)"      # Warm Sage (Primary Brand Voltage)
  primary-active: "oklch(45% 0.08 145)"
  primary-disabled: "oklch(40% 0.01 145)"
  ink: "oklch(96% 0.01 145)"          # Warm Cream (Tinted Neutral)
  body: "oklch(85% 0.01 145)"         # Muted Cream-Slate
  canvas: "oklch(28% 0.01 145)"       # Matte Slate (The "Midnight Floor")
  surface-card: "oklch(24% 0.01 145)"
  surface-dark: "oklch(18% 0.01 145)"
  accent-leaf: "oklch(75% 0.12 145)"  # Vibrant growth accent
  neutral-tint: "oklch(35% 0.01 145)"

typography:
  h1:
    fontFamily: "Copernicus, Tiempos Headline, serif"
    fontSize: 36pt
    fontWeight: 400
    letterSpacing: "-1.2px"           # The "Claude" Secret Sauce
    lineHeight: 1.1
  body-md:
    fontFamily: "StyreneB, Inter, sans-serif"
    fontSize: 10pt
    lineHeight: 1.55
    letterSpacing: "0.2px"
  label-caps:
    fontFamily: "StyreneB, Inter, sans-serif"
    fontSize: 11pt
    fontWeight: 700
    letterSpacing: "0.5px"

rounded:
  sm: 4px
  md: 8px
  lg: 12px

spacing:
  margin: 1.5cm
  gutter: 1cm
  rhythm: 1.25                 # Hierarchy ratio

components:
  section-box:
    backgroundColor: "{colors.surface-card}"
    textColor: "{colors.ink}"
    rounded: "{rounded.lg}"
    stroke: "1px {colors.primary}"
  header-block:
    backgroundColor: "{colors.primary}"
    textColor: "{colors.canvas}"
---

## Overview

**Claude-Midnight-Botanical** is a design system for high-focus technical consumption. It rejects the "Cool Blue" corporate reflex in favor of a warm, organic dark mode. It is the visual equivalent of reading a masterfully typeset book in a greenhouse after dark.

## The Midnight Scene
*A senior architect, isolated in a dim room at 2 AM, needs to parse a complex system diagram. The screen must not emit blue-light glare; it must feel like paper illuminated by a soft, green-tinted lamp.*

## Color Strategy: Living Neutrals
We do not use dead grays. Every neutral (Ink, Body, Canvas) is tinted with **0.01 Chroma at 145° Hue**. This ensures the interface feels like a single, cohesive organism rather than a collection of separate boxes.

## Typography: The Literary Voice
The Serif `h1` is the brand's anchor. The negative letter-spacing (-1.2px) is mandatory; without it, the typeface loses its "Academic Gravitas" and becomes generic.
