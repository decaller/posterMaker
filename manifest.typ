#let files = sys.inputs.at("files", default: "").split(",").filter(f => f != "")

#let manifest = files.map(f => {
  let data = json("data/" + f)
  "- **" + data.at("title", default: f) + "**: defined in `data/" + f + "`"
}).join("\n")

#metadata(manifest) <manifest>
