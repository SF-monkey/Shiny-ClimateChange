function(){
	tabPanel("About",
		HTML("
      <h1>Safer Fang</h1>
		  <p>
        Hello! My name is Safer(YouYang) Fang, student from SFU with working knowledge in Data Science.
		  </p>
      <p>
        In this project let's talk about <b>Climate Change</b>.<br>
        Climate change is a big topic. With limited data and resource, I will focus on evidences that are easy and clean for understanding.<br>
        The 1st page will allow users to intereact with yearly CO2 level data, generate plots of their choises.<br>
        The 2nd page is a structured story of the temperature data for what I discovered. Here since I only have the canadian data, we will look into some climate change in Canada.<br>
        The last page is the About page, a short personal info of the Author(myself) and the purpose of this Shiny App.<br>
      </p>
		"),
    HTML('
      <div style="clear: left;">
        <img src="https://scontent-sea1-1.xx.fbcdn.net/v/t1.0-9/1661197_276852945803209_118833644_n.jpg?_nc_cat=101&_nc_ht=scontent-sea1-1.xx&oh=ad37c955520bb412224140c1742a4bfa&oe=5D48E279" alt="" height="205" width="205">
      </div>
      <p>
        <a href="https://ca.linkedin.com/in/saferfang" target="_blank">Safer Fang</a><br>
        Data Science Student, Simon Fraser University<br>
        <a href="mailto:fyysafer@hotmail.com" target="_blank">Email</a><br>
        <a href="https://safersky.github.io/" target="_blank">Blog</a><br>
      </p>
    '),
		value="about"
	)
}
