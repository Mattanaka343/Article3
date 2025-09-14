StoryScrape = function(url) {
    page = read_html(url)

    story_id = page |> html_node('.storytitle') |> html_text()

    
    if (length(page |> html_elements('.storyinfo a') |> html_text()) < 5){
      location = (page |> html_elements('.storyinfo a') |> html_text())[3]
      category = (page |> html_elements('.storyinfo a') |> html_text())[4]
    }
    else{
      location = (page |> html_elements('.storyinfo a') |> html_text())[4]
      if(location == "United States"){
        category = (page |> html_elements('.storyinfo a') |> html_text())[6]
      }
      else{
        category = (page |> html_elements('.storyinfo a') |> html_text())[5]
      }
    }
    
    text = page |> html_element('#story') |> html_text()

    data.frame(
        story_id = story_id,
        location = location,
        category = category,
        text = text,
        stringsAsFactors = FALSE
    )
}