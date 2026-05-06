// ----------------------------------------------------------------------------
// MANIFEST COLLECTOR
// This file is used to extract information from all your JSON data files
// so we can automatically update the llms.txt documentation.
// ----------------------------------------------------------------------------

// 1. Get the list of files passed from the command line (via --input files="...")
// sys.inputs allows us to pass external variables into Typst.
#let files = sys.inputs.at("files", default: "").split(",").filter(f => f != "")

// 2. Transform the list of filenames into a list of Markdown-formatted strings.
// .map() goes through each file, loads its JSON, and extracts the title.
#let manifest = files.map(f => {
  let data = json("data/" + f)
  "- **" + data.at("title", default: f) + "**: defined in `data/" + f + "`"
}).join("\n")

// 3. Store the result in a "Metadata" block with a <manifest> label.
// This doesn't appear on a PDF, but can be "queried" by our script.
#metadata(manifest) <manifest>
