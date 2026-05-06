// ----------------------------------------------------------------------------
// POSTER DESIGN SYSTEM
// This file defines the "Look and Feel" of all posters in this repo.
// ----------------------------------------------------------------------------

// The main 'poster' function that wraps everything.
// Think of this as the "Layout Engine".
#let poster(
  title: "",
  authors: (),
  footer: [],
  columns: 3,
  body
) = {
  // Page Configuration: Setting paper size, margins, and background color.
  set page(
    paper: "a3",
    margin: (x: 1.5cm, y: 1.5cm),
    background: place(top + left, rect(width: 100%, height: 100%, fill: rgb("#3F443E"))),
    footer: [
      #set text(size: 8pt, fill: gray.darken(20%))
      #grid(
        columns: (1fr, 1fr),
        align(left)[#footer],
        align(right)[Generated with PosterMaker (Typst)]
      )
    ]
  )

  // Typography Settings: Using a high-quality academic Serif/Sans split.
  set text(font: ("DejaVu Sans"), size: 10pt, fill: rgb("#E6DFD8"))
  
  // Title Section: A large, centered Serif title.
  block(width: 100%, inset: (bottom: 1cm))[
    #set align(center)
    #text(font: ("DejaVu Serif"), size: 36pt, weight: "regular", fill: rgb("#FAF9F5"), tracking: -0.9pt)[#title]
    #if authors.len() > 0 {
      v(0.5cm)
      text(size: 14pt, fill: gray.darken(50%))[#authors.join(", ")]
    }
  ]

  // Main Layout: The body now flows directly after the title.
  // Use a grid in your main.typ for multi-column layouts.
  body
}

// COMPONENT: Section Box
// A reusable box with a header and a body.
#let section-box(title: "", color: rgb("#3b82f6"), body) = {
  block(
    width: 100%,
    stroke: 0.5pt + color,
    radius: 8pt,
    clip: true,
    fill: rgb("#252B24"),
    stack(
      block(
        width: 100%,
        fill: color,
        inset: 8pt,
        text(fill: rgb("#FAF9F5"), weight: "bold", size: 11pt)[#title]
      ),
      block(
        width: 100%,
        inset: 12pt,
        text(fill: rgb("#FAF9F5"), size: 10pt)[#body]
      )
    )
  )
}

// COMPONENT: Step Box
// Used for detailed steps within a phase.
#let step-box(
  title: "",
  desc: "",
  prompt: "",
  result: "",
  failure: "",
  fix: ""
) = {
  block(
    width: 100%,
    inset: 12pt,
    radius: 6pt,
    fill: rgb("#1D221C"),
    stroke: 0.5pt + rgb("#5D6B41"),
    stack(
      dir: ttb,
      spacing: 8pt,
      // Title
      if title != "" { text(weight: "bold", size: 11pt, fill: rgb("#FAF9F5"))[#title] },
      
      // Description
      if desc != "" { text(size: 10pt, fill: rgb("#E6DFD8"))[#desc] },
      
      // Prompt Block
      if prompt != "" {
        block(
          width: 100%,
          fill: rgb("#252B24"),
          inset: 8pt,
          radius: 4pt,
          stroke: (left: 2pt + rgb("#5D6B41")),
          text(size: 9pt, style: "italic", fill: rgb("#FAF9F5"))[💬 #prompt]
        )
      },
      
      // Result / Success
      if result != "" {
        text(size: 9pt, fill: rgb("#75FB4C").lighten(20%))[*✅ Result:* #result]
      },
      
      // Failure / Warning
      if failure != "" {
        text(size: 9pt, fill: rgb("#ef4444").lighten(20%))[*💥 Failure:* #failure]
      },
      
      // Fix
      if fix != "" {
        text(size: 9pt, fill: rgb("#3b82f6").lighten(20%))[*🔧 Fix:* #fix]
      }
    )
  )
}

// COMPONENT: Flowchart Start/End Node
#let start-node(content) = {
  rect(
    inset: 6pt,
    radius: 50%, // Oval/Pill shape
    fill: rgb("#5D6B41"),
    stroke: 0.5pt + rgb("#FAF9F5"),
    align(center, text(size: 8pt, weight: "bold", fill: rgb("#FAF9F5"))[#content])
  )
}

// COMPONENT: Flowchart Decision Node (Diamond-ish)
#let decision-node(content) = {
  polygon(
    fill: rgb("#252B24"),
    stroke: 0.5pt + rgb("#ef4444"),
    (0%, 50%),
    (50%, 0%),
    (100%, 50%),
    (50%, 100%),
  )
  place(center + horizon, block(width: 80%)[
    #set align(center)
    #text(size: 8pt, fill: rgb("#FAF9F5"), weight: "bold")[#content]
  ])
  v(1.5cm) // Give it space since it's a polygon
}

// COMPONENT: Step Node
// Used for simple flowchart sequences.
#let step-node(content, fill: rgb("#3F443E")) = {
  rect(
    inset: 8pt,
    radius: 4pt,
    fill: fill,
    stroke: 0.5pt + rgb("#5D6B41").darken(20%),
    align(center, text(size: 9pt, fill: rgb("#FAF9F5"))[#content])
  )
}

// COMPONENT: Arrow
// A simple visual separator for flowcharts.
#let arrow-down = {
  v(-4pt)
  align(center, text(size: 12pt, fill: rgb("#5D6B41"))[↓])
  v(-4pt)
}

// COMPONENT: Callout
// A highlighted box for "Pro Tips" or warnings.
#let callout(body) = {
  block(
    fill: rgb("#252B24"),
    inset: 10pt,
    radius: 4pt,
    width: 100%,
    stroke: 1pt + rgb("#5D6B41"),
    text(size: 9pt, style: "italic", fill: rgb("#FAF9F5"))[#body]
  )
}

// COMPONENT: Level Badge
// Specific for "Recipes" to show difficulty at a glance.
#let level-badge(level, tweak) = {
  block(
    fill: rgb("#252B24"),
    inset: 10pt,
    radius: 4pt,
    stroke: 0.5pt + rgb("#5D6B41"),
    grid(
      columns: (1fr, 1fr),
      align(left, text(weight: "bold", fill: rgb("#FAF9F5"))[Babysitting: #level]),
      align(right, text(style: "italic", fill: rgb("#E6DFD8"))[Manual Tweak: #tweak])
    )
  )
}
