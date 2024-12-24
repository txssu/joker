[
  inputs: ["{mix,.formatter}.exs", "{config,lib,test}/**/*.{ex,exs}"],
  line_length: 120,
  plugins: [Styler],
  import_deps: [:typedstruct]
]
