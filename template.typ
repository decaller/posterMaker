// ----------------------------------------------------------------------------
// POSTER DESIGN SYSTEM
// This file defines the "Look and Feel" of all posters in this repo.
// ----------------------------------------------------------------------------

// The main 'poster' function that wraps everything.
#let poster(
  title: "",
  authors: (),
  footer: [],
  columns: 3,
  body
) = {
  // Page Configuration: Tighter margins for density.
  set page(
    paper: "a3",
    margin: (left: 3.5cm, right: 1cm, top: 1cm, bottom: 1cm), // Wide left margin for sidebar title
    background: {
      // Midnight Floor
      place(top + left, rect(width: 100%, height: 100%, fill: rgb("#3F443E")))
      // Subtle Blueprint Grid
      for x in range(0, 100, step: 5) {
        place(top + left, dx: (x * 1%), line(start: (0%, 0%), end: (0%, 100%), stroke: 0.1pt + rgb("#5D6B41").darken(40%)))
      }
      for y in range(0, 100, step: 5) {
        place(top + left, dy: (y * 1%), line(start: (0%, 0%), end: (100%, 0%), stroke: 0.1pt + rgb("#5D6B41").darken(40%)))
      }
    },
    footer: [
      #set text(size: 7pt, fill: gray.darken(20%))
      #grid(
        columns: (1fr, 1fr),
        align(left)[#footer],
        align(right)[Generated with PosterMaker (Mindmap Edition)]
      )
    ]
  )

  // Typography Settings: High density (9pt body).
  set text(font: ("DejaVu Sans"), size: 9pt, fill: rgb("#E6DFD8"))
  
  // SIDEBAR TITLE: Rotated vertical title to save vertical space.
  place(
    top + left,
    dx: -2.8cm,
    dy: 100% - 2cm,
    rotate(-90deg, origin: left + top)[
      #block(width: 25cm)[
        #text(font: ("DejaVu Serif"), size: 42pt, weight: "bold", fill: rgb("#FAF9F5").darken(5%), tracking: -1.5pt)[#title]
        #if authors.len() > 0 {
          h(1cm)
          text(size: 12pt, fill: rgb("#5D6B41").lighten(40%))[*By:* #authors.join(", ")]
        }
      ]
    ]
  )

  // Main Layout
  body
}

// COMPONENT: Mindmap Connector
// A simple line to link boxes across the flow.
#let connector(dx: 0pt, dy: 0pt, length: 2cm, angle: 0deg) = {
  place(
    dx: dx,
    dy: dy,
    rotate(angle, origin: left + top, line(length: length, stroke: 0.5pt + rgb("#5D6B41").darken(30%)))
  )
}

// COMPONENT: Section Box
// A reusable box with a header and a body.
#let section-box(title: "", color: rgb("#3b82f6"), body) = {
  block(
    width: 100%,
    stroke: 0.5pt + color,
    radius: 6pt,
    clip: true,
    fill: rgb("#252B24"),
    stack(
      block(
        width: 100%,
        fill: color,
        inset: 6pt,
        text(fill: rgb("#FAF9F5"), weight: "bold", size: 10pt)[#title]
      ),
      block(
        width: 100%,
        inset: 10pt,
        text(fill: rgb("#FAF9F5"), size: 9pt)[#body]
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
