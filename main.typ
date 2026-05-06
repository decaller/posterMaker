// ----------------------------------------------------------------------------
// POSTER RENDERER (ENTRY POINT)
// This file connects your JSON data to the Design Template.
// ----------------------------------------------------------------------------

#import "template.typ": *

// 1. DATA LOADING
#let data = json("data/repo-guide.json")

// 2. HELPER: MARKDOWN RENDERER
#let render-md(content) = {
  if type(content) != str { return content }
  let converted = content.replace("**", "*").replace("#", "\#")
  eval(converted, mode: "markup")
}

// 3. TEMPLATE INITIALIZATION
#show: body => poster(
  title: data.title,
  authors: data.authors,
  footer: [AI Agent Context: #link("https://yourserver.com/llms.txt")],
  columns: 3,
  body
)

// 4. MASONRY LAYOUT ENGINE
// We use columns() + breakable: false blocks to create a Masonry effect.
// Content flows vertically and fills the next column instead of sticking to rows.
#columns(3, gutter: 1cm)[
  
  // RECIPE SPECIFIC HEADER
  // Note: Columns don't support easy colspan: 3 for headers. 
  // We place it outside if needed, or keep it in flow.
  #if data.at("babysitting_level", default: none) != none {
    level-badge(data.babysitting_level, data.manual_tweak)
    v(1cm)
  }

  // CONTENT RENDERING LOOP
  #for section in data.sections {
    // block(breakable: false) is the key to Masonry. 
    // It prevents a section from splitting between columns.
    block(width: 100%, breakable: false, inset: (bottom: 1cm))[
      #section-box(title: section.title, color: rgb(section.color))[
        #if section.at("is_flow", default: false) {
          for (i, step) in section.steps.enumerate() {
            let content = if type(step) == str { step } else { step.at("content", default: "") }
            let kind = if type(step) == str { "step" } else { step.at("kind", default: "step") }
            
            if kind == "start" {
              start-node(render-md(content))
            } else if kind == "decision" {
              decision-node(render-md(content))
            } else {
              step-node(render-md(content))
            }
            
            if i < section.steps.len() - 1 {
              arrow-down
            }
          }
        } else if section.at("steps", default: none) != none {
          stack(
            dir: ttb,
            spacing: 12pt,
            ..section.steps.map(step => {
              if type(step) == str {
                step-box(desc: render-md(step))
              } else {
                step-box(
                  title: step.at("title", default: ""),
                  desc: render-md(step.at("desc", default: "")),
                  prompt: step.at("prompt", default: ""),
                  result: render-md(step.at("result", default: "")),
                  failure: render-md(step.at("failure", default: "")),
                  fix: render-md(step.at("fix", default: ""))
                )
              }
            })
          )
        } else {
          render-md(section.content)
        }
      ]
    ]
  }
]

// 5. FOOTER CALLOUT
#v(1fr)
#callout[
  *Pro Tip:* This is a Masonry layout. Content flows vertically to fill gaps!
]
