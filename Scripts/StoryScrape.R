StoryScrape = function(url) {
    page = read_html(url)

    title = page |> html_node('.storytitle') |> html_text()

    location = (page |> html_elements('.storyinfo a') |> html_text())[4]

    category = (page |> html_elements('.storyinfo a') |> html_text())[5]

    text = page |> html_element('#story') |> html_text()

    data.frame(
        title = title,
        location = location,
        category = category,
        text = text,
        stringsAsFactors = FALSE
    )
}