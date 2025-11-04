# Load functions
source("app_functions.R")

# Define the Server (Backend)
server <- function(input, output) {
  dna_seq <- eventReactive(input$generate, {
    probs <- c(input$prob_A, input$prob_T, input$prob_C, input$prob_G)
    gene_dna(length = input$n_bases, base_probs = probs)
  })
  
  output$dna <- renderText({
    dna_seq()
  })
  
  output$rna <- renderText({
    transcribe_dna(dna_seq())
  })
  
  output$protein <- renderText({
    translate_rna(transcribe_dna(dna_seq()))
  })
  
  output$freqs <- renderTable({
    base_freqs(dna_seq())
  })
}
