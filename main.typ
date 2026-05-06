#import "template.typ": *

// Load data
// #let data = json("data/how-to.json")
#let data = json("data/ai-recipe.json")

#show: body => poster(
  title: data.title,
  authors: data.authors,
  footer: [AI Agent Context: #link("https://yourserver.com/llms.txt")],
  columns: 3,
  body
)

#if data.at("babysitting_level", default: none) != none {
  level-badge(data.babysitting_level, data.manual_tweak)
  v(0.5cm)
}

#for section in data.sections {
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
}

#v(1fr)

#callout[
  *Pro Tip:* Use Typst's `#link` to embed direct paths to your source code. This poster is compiled from `main.typ` and `data/how-to.json`.
]
