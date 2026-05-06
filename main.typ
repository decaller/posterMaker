// ----------------------------------------------------------------------------
// POSTER RENDERER (ENTRY POINT)
// This file connects your JSON data to the Design Template.
// ----------------------------------------------------------------------------

#import "template.typ": *

// 1. DATA LOADING
// You can switch posters by changing the filename here.
// #let data = json("data/how-to.json")
#let data = json("data/ai-recipe.json")

// 2. TEMPLATE INITIALIZATION
// We call the 'poster' function and pass in the global metadata.
#show: body => poster(
  title: data.title,
  authors: data.authors,
  footer: [AI Agent Context: #link("https://yourserver.com/llms.txt")],
  columns: 3,
  body
)

// 3. RECIPE SPECIFIC HEADER
// If the data includes "babysitting_level", we show the difficulty badge.
#if data.at("babysitting_level", default: none) != none {
  level-badge(data.babysitting_level, data.manual_tweak)
  v(0.5cm)
}

// 4. CONTENT RENDERING LOOP
// We loop through each 'section' defined in your JSON file.
#for section in data.sections {
  // Use grid.cell to allow some sections to span multiple columns (span: 2)
  grid.cell(colspan: section.at("span", default: 1))[
    #section-box(title: section.title, color: rgb(section.color))[
      
      // If it's a "flowchart" section, render it as a sequence of steps.
      #if section.at("is_flow", default: false) {
        for (i, step) in section.steps.enumerate() {
          step-node(step)
          if i < section.steps.len() - 1 {
            arrow-down
          }
        }
      } 
      // Otherwise, just render the text content.
      else {
        section.content
      }
    ]
  ]
}

// 5. FOOTER CALLOUT
#v(1fr) // This pushes the following block to the very bottom of the page.
#callout[
  *Pro Tip:* This poster is built dynamically. To change a value, just edit the JSON file!
]
