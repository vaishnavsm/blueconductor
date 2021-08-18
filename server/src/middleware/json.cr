require "kemal"

class JsonHeaderInjector < Kemal::Handler
  JSONContentType = "application/json"

  def call(ctx)
    call_next ctx
    ctx.response.content_type = JSONContentType
  end
end

def default_to_json_response()
  add_handler JsonHeaderInjector.new
end
