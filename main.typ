#set page(width: 21cm, height: 29.7cm, columns: 2, margin: 1cm)

#show heading: it => [
  #set align(center)
  #set text(9pt, weight: "bold")
  #set par(leading: 0pt)
  #block(smallcaps(it.body))
]

#let mode = if "mode" in sys.inputs { sys.inputs.mode } else { "default" }
#let directory = if mode == "default" { "questions" } else if mode == "sorted" {
  "questions-sorted"
} else { "questions" }

#text(size: 8pt, top-edge: 1em)[
  #{
    for num in range(1, 16) {
      let filename
      if num < 10 {
        filename = directory + "/0" + str(num) + ".typ"
      } else {
        filename = directory + "/" + str(num) + ".typ"
      }
      block(breakable: true)[
        #include (filename)
        #v(10pt)
      ]
    }
  }
]
