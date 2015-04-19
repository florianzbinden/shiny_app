
library(shiny)
shinyUI(
  
  navbarPage("Swiss dataset",
             tabPanel("Plot",
  
  pageWithSidebar(
    
    headerPanel("Swiss dataset"),
    sidebarPanel(
        sliderInput('Examination', 'Guess at the Agriculture by sliding Examination', value = 15, min = 0, max = 35, step = 1,),   
   h4("As Examination, you entered"),
   verbatimTextOutput("Examination"),
   h4("The regression fit calculated an Agriculture value of"),
   verbatimTextOutput("Agriculture"),
   
   
   h6("by Florian Z, link to code in", a("Github", 
                                         href="https://github.com/florianzbinden/shiny_app"))    
   
   ),    
    mainPanel(
      h3("Vizualisation of the swiss dataset"),
      h5("Graphically, the Examination predictor can be represented against the Agriculture"),
        plotOutput('p2') 
    )
)),

tabPanel("About",
         headerPanel("Swiss dataset"),
         mainPanel(
           h4("What is this web page and what is this app ?!?"),
           h5("In the frame of a Coursera MOOC, a shiny app and this webpage
              are created in order to demonstrate new skills with the R programming language. 
              This app is basically a prediction based upon a linear regression."),
           
           h4("Description of the swiss dataset shiny app"),
           
           h5("The swiss dataset, contained in the datasets package in R, represents 
the standardized fertility
              measure and socio-economic indicators for each of 47 
              French-speaking provinces of Switzerland at about 1888.
              The dataset contains several predictors but only one, the Examination, was selected
in order to predict the Agriculture.
"),
           
           h4("Variables"),
           h5("Examination : % draftees receiving highest mark on army examination.
Agriculture : % of males involved in agriculture as occupation.
"),
           
           h4("Prediction : how this works ? "),
           h5(" A linear regression is carried out and Examination (choosen with the slider) 
is computed in order to give the Agriculture value. The red line on the graph shows the Examination value.
Examination value is recalled below the graph as well as the calculated Agriculture value.
              It seems logical that the more educated the people are, the less likely 
              they are to work in the agriculture field, even in 1888.")
         ) 
       
     
   
)  
)
)
