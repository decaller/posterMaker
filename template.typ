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
  set text(font: ("Adwaita Sans", "Cantarell", "DejaVu Sans"), size: 10pt, fill: rgb("#E6DFD8"))
  
  // Title Section: A large, centered Serif title.
  block(width: 100%, inset: (bottom: 1cm))[
    #set align(center)
    #text(font: ("DejaVu Serif", "serif"), size: 36pt, weight: "regular", fill: rgb("#FAF9F5"), tracking: -1.2pt)[#title]
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
    stroke: 0.5pt + color,
    radius: 8pt,
    clip: true,
    fill: rgb("#252B24"),
    stack(
      block(
        width: 100%,
        fill: color,
        inset: 8pt,
        text(fill: rgb("#3F443E"), weight: "bold", size: 11pt)[#title]
      ),
      block(
        width: 100%,
        inset: 12pt,
        text(fill: rgb("#FAF9F5"), size: 10pt)[#body]
      )
    )
  )
}

// COMPONENT: Step Node
// Used for the workflow/flowchart sections.
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
  align(center, text(size: 15pt, fill: gray)[↓])
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
