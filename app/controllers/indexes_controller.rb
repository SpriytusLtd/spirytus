class IndexesController < ApplicationController
  def index
    @alcoholics = Alcoholic.all
    @brewers = Brewer.all
    @alcohol = [
      { text: '3%以下', number: 3 },
      { text: '5%以下', number: 5 },
      { text: '10%以下', number: 10 },
      { text: '15%以下', number: 15 },
      { text: '20%以下', number: 20 },
      { text: '40%以下', number: 40 },
      { text: '41%以上', number: 100 }
    ]
  end
end
