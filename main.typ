// ----------------------------------------------------------------------------
// POSTER RENDERER (ENTRY POINT)
// This file connects your JSON data to the Design Template.
// ----------------------------------------------------------------------------

#import "template.typ": *

// 1. DATA LOADING
#let data = json("data/repo-guide.json")

// 2. TEMPLATE INITIALIZATION
#show: body => poster(
  title: data.title,
  authors: data.authors,
  footer: [AI Agent Context: #link("https://yourserver.com/llms.txt")],
  columns: 3,
  body
)

// 3. MAIN GRID LAYOUT
#grid(
  columns: (1fr, 1fr, 1fr),
  column-gutter: 1cm,
  row-gutter: 1cm,

  // RECIPE SPECIFIC HEADER (Spans all columns)
  if data.at("babysitting_level", default: none) != none {
    grid.cell(colspan: 3)[
      #level-badge(data.babysitting_level, data.manual_tweak)
      #v(0.5cm)
    ]
  },

  // CONTENT RENDERING LOOP
  // We use .. and .map to ensure each section is a direct child of the grid.
  ..data.sections.map(section => {
    grid.cell(colspan: section.at("span", default: 1))[
      #section-box(title: section.title, color: rgb(section.color))[
        #if section.at("is_flow", default: false) {
          for (i, step) in section.steps.enumerate() {
            step-node(step)
            if i < section.steps.len() - 1 {
              arrow-down
            }
          }
        } else {
          section.content
        }
      ]
    ]
  })
)

// 4. FOOTER CALLOUT
#v(1fr)
#callout[
  *Pro Tip:* This poster is built dynamically. To change a value, just edit the JSON file!
]
