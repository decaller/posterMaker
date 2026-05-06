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
    background: place(top + left, rect(width: 100%, height: 100%, fill: rgb("#fafafa"))),
    footer: [
      #set text(size: 8pt, fill: gray.darken(20%))
      #grid(
        columns: (1fr, 1fr),
        align(left)[#footer],
        align(right)[Generated with PosterMaker (Typst)]
      )
    ]
  )

  // Typography Settings: Using high-quality system fonts.
  set text(font: ("Adwaita Sans", "Cantarell", "DejaVu Sans"), size: 10pt, fill: rgb("#333333"))
  
  // Title Section: A large, centered title block at the top.
  block(width: 100%, inset: (bottom: 1cm))[
    #set align(center)
    #text(size: 32pt, weight: "bold", fill: rgb("#1a1a1a"))[#title]
    #if authors.len() > 0 {
      v(0.5cm)
      text(size: 14pt, fill: gray.darken(50%))[#authors.join(", ")]
    }
  ]

  // Main Grid Layout: This is where the magic happens.
  // It takes all your "body" content and puts it into columns.
  grid(
    columns: (1fr,) * columns, // Creates 'n' columns of equal width (1fr)
    column-gutter: 1cm,
    row-gutter: 1cm,
    body // Placed directly into the grid
  )
}

// COMPONENT: Section Box
// A reusable box with a header and a body.
#let section-box(title: "", color: rgb("#3b82f6"), body) = {
  block(
    width: 100%,
    stroke: 0.5pt + color.lighten(50%),
    radius: 4pt,
    clip: true,
    fill: white,
    stack(
      block(
        width: 100%,
        fill: color,
        inset: 8pt,
        text(fill: white, weight: "bold", size: 11pt)[#title]
      ),
      block(
        width: 100%,
        inset: 10pt,
        body
      )
    )
  )
}

// COMPONENT: Step Node
// Used for the workflow/flowchart sections.
#let step-node(content, fill: rgb("#f3f4f6")) = {
  rect(
    inset: 8pt,
    radius: 4pt,
    fill: fill,
    stroke: 0.5pt + gray.lighten(50%),
    align(center, text(size: 9pt)[#content])
  )
}

// COMPONENT: Arrow
// A simple visual separator for flowcharts.
#let arrow-down = {
  align(center, text(size: 15pt, fill: gray)[↓])
}

// COMPONENT: Callout
// A highlighted box for "Pro Tips" or warnings.
#let callout(body) = {
  block(
    fill: rgb("#fef3c7"),
    inset: 10pt,
    radius: 4pt,
    width: 100%,
    text(size: 9pt, style: "italic")[#body]
  )
}

// COMPONENT: Level Badge
// Specific for "Recipes" to show difficulty at a glance.
#let level-badge(level, tweak) = {
  block(
    fill: rgb("#f3f4f6"),
    inset: 10pt,
    radius: 4pt,
    stroke: 0.5pt + gray.lighten(30%),
    grid(
      columns: (1fr, 1fr),
      align(left, text(weight: "bold")[Babysitting: #level]),
      align(right, text(style: "italic", fill: gray.darken(30%))[Manual Tweak: #tweak])
    )
  )
}
