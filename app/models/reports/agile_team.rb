class Reports::AgileTeam
  attr_accessor :score_cards, :answers, :question_count, :score_card_count
  
  def initialize(score_cards:)
    self.score_cards = score_cards
    
    create_report
  end
  
  def create_report
    # build multi-array to store question and answers
    results_array = [[]]

    # determine the size of the results array, maxing at 6
    if score_cards.count < 5
      score_cards.count.times{ |_a| results_array << [] }
    else
      5.times{ |_a| results_array << [] }
    end

    # dump questions into the first array within results_array and populate the other arrays with answers
    question_array = []
    array_answer_count = 1
    score_cards.reverse.each do |sc| # reverse order to return oldest left to right
      sc.score_card_answers.each do |sca|
        question_array << sca.question.title if array_answer_count == 1
        results_array[array_answer_count] << sca.score
      end
      array_answer_count += 1
    end

    # combine question array and results_array (which is now full of answers)
    results_array[0] = question_array
    
    # We now have a results_array that looks like this: [[q], [a], [a], [a], [a], [a]]
    self.answers = results_array
    self.question_count = question_array.count
    self.score_card_count = score_cards.count + 1
  end
end