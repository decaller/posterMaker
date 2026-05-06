// ----------------------------------------------------------------------------
// POSTER DESIGN SYSTEM
// This file defines the "Look and Feel" of all posters in this repo.
// ----------------------------------------------------------------------------

// ----------------------------------------------------------------------------
// POSTER DESIGN SYSTEM
// This file defines the "Look and Feel" of all posters in this repo.
// ----------------------------------------------------------------------------

// DEFAULT THEME: Claude-Midnight-Botanical
#let default-theme = (
  colors: (
    canvas: rgb("#3F443E"),      // Midnight Floor
    surface: rgb("#252B24"),     // Box Background
    card: rgb("#1D221C"),        // Step Background
    ink: rgb("#E6DFD8"),         // Body Text
    title: rgb("#FAF9F5"),       // Title Text
    primary: rgb("#5D6B41"),     // Accents/Borders
    grid: rgb("#5D6B41").darken(40%), // Blueprint lines
    warning: rgb("#ef4444"),
    success: rgb("#75FB4C"),
    info: rgb("#3b82f6")
  ),
  fonts: (
    title: "DejaVu Serif",
    body: "DejaVu Sans"
  ),
  sizes: (
    title: 42pt,
    section: 10pt,
    step: 9pt,
    body: 9pt
  ),
  spacing: (
    margin: (left: 3.5cm, right: 1cm, top: 1cm, bottom: 1cm),
    gutter: 0.5cm,
    rhythm: 8pt
  )
)

/// Merges user overrides into the default theme.
#let theme-helper(overrides) = {
  let theme = default-theme
  if overrides == none { return theme }
  
  // Shallow merge for top-level keys
  for (key, value) in overrides {
    if type(value) == dictionary and key in theme {
      for (sub-key, sub-value) in value {
        theme.at(key).insert(sub-key, sub-value)
      }
    } else {
      theme.insert(key, value)
    }
  }
  return theme
}

// The main 'poster' function that wraps everything.
#let poster(
  title: "",
  authors: (),
  footer: [],
  columns: 3,
  theme: default-theme,
  body
) = {
  // Page Configuration
  set page(
    paper: "a3",
    margin: theme.spacing.margin,
    background: {
      // Background Canvas
      place(top + left, rect(width: 100%, height: 100%, fill: theme.colors.canvas))
      // Subtle Blueprint Grid
      for x in range(0, 100, step: 5) {
        place(top + left, dx: (x * 1%), line(start: (0%, 0%), end: (0%, 100%), stroke: 0.1pt + theme.colors.grid))
      }
      for y in range(0, 100, step: 5) {
        place(top + left, dy: (y * 1%), line(start: (0%, 0%), end: (100%, 0%), stroke: 0.1pt + theme.colors.grid))
      }
    },
    footer: [
      #set text(size: 7pt, fill: theme.colors.ink.darken(20%))
      #grid(
        columns: (1fr, 1fr),
        align(left)[#footer],
        align(right)[Generated with PosterMaker (Themeable)]
      )
    ]
  )

  // Typography Settings
  set text(font: (theme.fonts.body), size: theme.sizes.body, fill: theme.colors.ink)
  
  // SIDEBAR TITLE
  place(
    top + left,
    dx: -2.8cm,
    dy: 100% - 2cm,
    rotate(-90deg, origin: left + top)[
      #block(width: 25cm)[
        #text(font: (theme.fonts.title), size: theme.sizes.title, weight: "bold", fill: theme.colors.title, tracking: -1.5pt)[#title]
        #if authors.len() > 0 {
          h(1cm)
          text(size: 12pt, fill: theme.colors.primary.lighten(40%))[*By:* #authors.join(", ")]
        }
      ]
    ]
  )

  body
}

// COMPONENT: Mindmap Connector
#let connector(dx: 0pt, dy: 0pt, length: 2cm, angle: 0deg, theme: default-theme) = {
  place(
    dx: dx,
    dy: dy,
    rotate(angle, origin: left + top, line(length: length, stroke: 0.5pt + theme.colors.primary.darken(30%)))
  )
}

// COMPONENT: Section Box
#let section-box(title: "", color: none, theme: default-theme, body) = {
  let accent = if color == none { theme.colors.primary } else { color }
  block(
    width: 100%,
    stroke: 0.5pt + accent,
    radius: 6pt,
    clip: true,
    fill: theme.colors.surface,
    stack(
      block(
        width: 100%,
        fill: accent,
        inset: 6pt,
        text(fill: theme.colors.title, weight: "bold", size: theme.sizes.section)[#title]
      ),
      block(
        width: 100%,
        inset: 10pt,
        text(fill: theme.colors.title, size: theme.sizes.body)[#body]
      )
    )
  )
}

// COMPONENT: Step Box
#let step-box(
  title: "",
  desc: "",
  prompt: "",
  result: "",
  failure: "",
  fix: "",
  theme: default-theme
) = {
  block(
    width: 100%,
    inset: 12pt,
    radius: 6pt,
    fill: theme.colors.card,
    stroke: 0.5pt + theme.colors.primary,
    stack(
      dir: ttb,
      spacing: theme.spacing.rhythm,
      if title != "" { text(weight: "bold", size: theme.sizes.step, fill: theme.colors.title)[#title] },
      if desc != "" { text(size: theme.sizes.body, fill: theme.colors.ink)[#desc] },
      if prompt != "" {
        block(
          width: 100%,
          fill: theme.colors.surface,
          inset: 8pt,
          radius: 4pt,
          stroke: (left: 2pt + theme.colors.primary),
          text(size: theme.sizes.body - 1pt, style: "italic", fill: theme.colors.title)[💬 #prompt]
        )
      },
      if result != "" {
        text(size: theme.sizes.body - 1pt, fill: theme.colors.success.lighten(20%))[*✅ Result:* #result]
      },
      if failure != "" {
        text(size: theme.sizes.body - 1pt, fill: theme.colors.warning.lighten(20%))[*💥 Failure:* #failure]
      },
      if fix != "" {
        text(size: theme.sizes.body - 1pt, fill: theme.colors.info.lighten(20%))[*🔧 Fix:* #fix]
      }
    )
  )
}

// COMPONENT: Flowchart Start/End Node
#let start-node(content, theme: default-theme) = {
  rect(
    inset: 6pt,
    radius: 50%,
    fill: theme.colors.primary,
    stroke: 0.5pt + theme.colors.title,
    align(center, text(size: theme.sizes.body - 1pt, weight: "bold", fill: theme.colors.title)[#content])
  )
}

// COMPONENT: Flowchart Decision Node
#let decision-node(content, theme: default-theme) = {
  polygon(
    fill: theme.colors.surface,
    stroke: 0.5pt + theme.colors.warning,
    (0%, 50%),
    (50%, 0%),
    (100%, 50%),
    (50%, 100%),
  )
  place(center + horizon, block(width: 80%)[
    #set align(center)
    #text(size: theme.sizes.body - 1pt, fill: theme.colors.title, weight: "bold")[#content]
  ])
  v(1.5cm)
}

// COMPONENT: Step Node
#let step-node(content, fill: none, theme: default-theme) = {
  let bg = if fill == none { theme.colors.canvas.lighten(10%) } else { fill }
  rect(
    inset: 8pt,
    radius: 4pt,
    fill: bg,
    stroke: 0.5pt + theme.colors.primary.darken(20%),
    align(center, text(size: theme.sizes.body, fill: theme.colors.title)[#content])
  )
}

// COMPONENT: Arrow
#let arrow-down(theme: default-theme) = {
  v(-4pt)
  align(center, text(size: 12pt, fill: theme.colors.primary)[↓])
  v(-4pt)
}

// COMPONENT: Callout
#let callout(body, theme: default-theme) = {
  block(
    fill: theme.colors.surface,
    inset: 10pt,
    radius: 4pt,
    width: 100%,
    stroke: 1pt + theme.colors.primary,
    text(size: theme.sizes.body, style: "italic", fill: theme.colors.title)[#body]
  )
}

// COMPONENT: Level Badge
#let level-badge(level, tweak, theme: default-theme) = {
  block(
    fill: theme.colors.surface,
    inset: 10pt,
    radius: 4pt,
    stroke: 0.5pt + theme.colors.primary,
    grid(
      columns: (1fr, 1fr),
      align(left, text(weight: "bold", fill: theme.colors.title)[Babysitting: #level]),
      align(right, text(style: "italic", fill: theme.colors.ink)[Manual Tweak: #tweak])
    )
  )
}

