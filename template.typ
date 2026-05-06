#let poster(
  title: "",
  authors: (),
  footer: [],
  columns: 3,
  body
) = {
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

  set text(font: "Inter", size: 10pt, fill: rgb("#333333"))
  
  // Title Section
  block(width: 100%, inset: (bottom: 1cm))[
    #set align(center)
    #text(size: 32pt, weight: "bold", fill: rgb("#1a1a1a"))[#title]
    #if authors.len() > 0 {
      v(0.5cm)
      text(size: 14pt, fill: gray.darken(50%))[#authors.join(", ")]
    }
  ]

  // Main Content Grid
  grid(
    columns: (1fr,) * columns,
    column-gutter: 1cm,
    row-gutter: 1cm,
    ..body
  )
}

// Custom Components
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

#let step-node(content, fill: rgb("#f3f4f6")) = {
  rect(
    inset: 8pt,
    radius: 4pt,
    fill: fill,
    stroke: 0.5pt + gray.lighten(50%),
    align(center, text(size: 9pt)[#content])
  )
}

#let arrow-down = {
  align(center, text(size: 15pt, fill: gray)[↓])
}

#let callout(body) = {
  block(
    fill: rgb("#fef3c7"),
    inset: 10pt,
    radius: 4pt,
    width: 100%,
    text(size: 9pt, style: "italic")[#body]
  )
}
