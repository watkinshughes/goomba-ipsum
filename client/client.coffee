$(document).ready ->
  
  $("#ipsum-form").submit ->
     
    goombaIpsum = (words) ->
      i = words.length
      j = undefined
      tempi = undefined
      tempj = undefined
      return false  if i is 0
      while --i
        j = Math.floor(Math.random() * (i + 1))
        tempi = words[i]
        tempj = words[j]
        words[i] = tempj
        words[j] = tempi
      words
    paragraphs = ""
    # chosen_button = $("#ipsum-form input[name='choice']:checked").val()
    paragraph_number = $("#paragraph_count").val()
    words = []
    words_all = ["It's not Lent stoonad. Calzone with proshoot' and mooozarell'.", "let's goomba ipsum some paesans. capeesh?", "perfecto tony. calzone tomorrow or you having the fish?", "Corleone fettucini Capone"]
    words = words_all
    sentence_number = Math.floor((Math.random() + 4) * 2)
    
    #Start the first FOR loop that builds sentences from words
    z = 0

    while z < paragraph_number
      sentence_group = ""
      
      #Start the second FOR loop that builds sentence groups from sentences
      y = 0

      while y < sentence_number
        
        #Start the third FOR loop that builds paragraphs from sentence groups
        x = 0

        while x < words.length
          
          #Create a variable for the randomized array of words
          #Convert array to string with no commas or quotes, add period to end
          #Capitalize first letter in string
          capitalizeFirstLetter = (string) ->
            string.charAt(0).toUpperCase() + string.slice(1)
          words_random = goombaIpsum(words)
          sentence = words_random.toString().replace(/,/g, " ") + ". "
          sentence_capped = capitalizeFirstLetter(sentence)
          x++
        
        #End the first FOR loop that builds sentences from words
        sentence_group += sentence_capped
        y++
      
      #End the second FOR loop that builds sentence groups from sentences
      paragraphs += "<p>" + sentence_group + "</p>"
      z++
    
    #End the third FOR loop that builds and spaces paragraphs from sentence groups
    $("#print-paragraphs").empty().html paragraphs
    
    #Prevent form from actually submitting so page does not reload
    false