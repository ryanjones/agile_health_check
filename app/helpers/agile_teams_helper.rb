module AgileTeamsHelper
  def td_color(text)
    if text == "Green"
      "green-background"
    elsif text == "Yellow"
      "yellow-background"
    elsif text == "Red"
      "red-background"
    end
  end
end
