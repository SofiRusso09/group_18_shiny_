# Define the User Interface (Frontend)
ui <- fluidPage(
  titlePanel("Virtual Gene Generator"),
  sidebarLayout(
    sidebarPanel(
      sliderInput(
        inputId = "n_bases",
        label = "Number of bases (must be multiple of 3):",
        min = 3,
        max = 60,
        value = 30,
        step = 3
      ),
      numericInput(
        inputId = "prob_A",
        label = "Probability of A:",
        value = 0.25,
        min = 0,
        max = 1,
        step = 0.05
      ),
      numericInput(
        inputId = "prob_T",
        label = "Probability of T:",
        value = 0.25,
        min = 0,
        max = 1,
        step = 0.05
      ),
      numericInput(
        inputId = "prob_C",
        label = "Probability of C:",
        value = 0.25,
        min = 0,
        max = 1,
        step = 0.05
      ),
      numericInput(
        inputId = "prob_G",
        label = "Probability of G:",
        value = 0.25,
        min = 0,
        max = 1,
        step = 0.05
      ),
      actionButton("generate", "Generate DNA Sequence")
    ),
    mainPanel(
      fluidRow(
        col_widths = 12,
        wellPanel(
          h4("Virtual Gene output"),
          verbatimTextOutput(outputId = "dna"),h4("RNA sequence:"),verbatimTextOutput("rna"),
          h4("Protein sequence:"),verbatimTextOutput("protein"),
          h4("Base frequencies:"),
          tableOutput("freqs")
        )
      )
    )
  )
)

