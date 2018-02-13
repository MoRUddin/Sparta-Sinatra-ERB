class GamesController < Sinatra::Base
  #sets root of the parent directory of the current file
  set :root, File.join(File.dirname(__FILE__), '..')
  #sets the view directory correctly
  set :view, Proc.new { File.join(root,"views")}

  #Enable reloader
  configure :development do
    register Sinatra::Reloader
  end

  $games = [
    {
      id: 0,
      title: "Borderlands 2",
      body: "Borderlands 2 allows players to complete a campaign consisting of central quests and optional side-missions as one of four treasure seekers, 'Vault Hunters', on the planet Pandora. Key gameplay features from its predecessor, such as online collaborative campaign gameplay, randomly generated loot, such as weapons and shields and character-building elements commonly found in role-playing video games are in Borderlands 2."
    },
    {
      id: 1,
      title: "The Binding of Isaac: Afterbirth+",
      body: "The young boy Isaac had been living happily with his mom. One day, spurred on by watching too many religious programs on the television, his mom believed she received instruction that Isaac had become corrupted and she must try to save him. First, she removed all his possessions, including his toys and clothes, believing these were corrupting him. Later, she locked him in his room to never be let out so as to protect him from the evils that existed outside. After hearing the further instruction that to show her devotion to her faith she must sacrifice her son, Isaac flees from his approaching mother through a trap door into the basement, leading to the events within the game."
    },
    {
      id: 2,
      title: "Sid Meier's Civilization V",
      body: "In Civilization V, the player leads a civilization from prehistoric times into the future on a procedurally generated map, attempting to achieve one of a number of different victory conditions through research, exploration, diplomacy, expansion, economic development, government and military conquest."
    }
  ]
  $dev = [
    {
      id: 0,
      name: "Gearbox"
    },
    {
      id: 1,
      name: "Nicalis"
    },
    {
      id: 2,
      name: "Firaxis Games"
    }
  ]

  #landing page
  get '/' do
    @title = "Landing Page"
    erb :'pages/landing'
  end

  get '/pages' do
    @title = "Index Page"
    @games = $games
    erb :'pages/index'
  end

  get '/pages/:id' do
    @title = $games[params[:id].to_i][:title]
    @body = $games[params[:id].to_i][:body]
    @games = $games
    @dev = $dev[params[:id].to_i][:name]
    erb :'pages/game_id'
  end
end
