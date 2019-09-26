class BoardsController < ApplicationController
  include HTTParty
  BASE_URI = 'https://api.monday.com/v2'

  def index
    response = HTTParty.get(BASE_URI,
                            headers: headers,
                            body: {
                              query: 'query {
                                  boards {
                                    name
                                    state
                                    owner{
                                      id
                                      name
                                    }
                                    groups {
                                      id
                                      title
                                      color
                                    }
                                    columns {
                                      id
                                      title
                                      type

                                    }
                                    items {
                                      id
                                      name
                                      column_values{
                                        id
                                      }
                                      group {
                                        id
                                      }
                                    }
                                  }
                              }'
                            })
    render json: response
  end

  private

  def headers
    {
      Authorization: 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJ0aWQiOjIzMjA5OTgxLCJ1aWQiOjEwNjQ3NTIyLCJpYWQiOiIyMDE5LTA5LTI2IDA1OjQ4OjQzIFVUQyIsInBlciI6Im1lOndyaXRlIn0.8rsjhSfc3_uXTX42xKwtp7oHLnLuM5ZBPaexUdi8yLI'
    }
  end
end
