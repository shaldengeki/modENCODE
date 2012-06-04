module PagesHelper
  def getCompletionProgress
    @transcriptionFactors = TranscriptionFactor.all
    @finishedFactorCount = TranscriptionFactor.joins(:isoforms => {:reagents => {:attempts => :statuses}}).where(:statuses => {:end => true}).count
    @processingFactorCount = TranscriptionFactor.joins(:isoforms => {:reagents => {:attempts => :statuses}}).where(:statuses => {:end => false}).count - @finishedFactorCount
    @inactiveFactorCount = @transcriptionFactors.count - @processingFactorCount

    @transcriptionFactorCount = @transcriptionFactors.count == 0 ? 1 : @transcriptionFactors.count
    @finishedFactorCount = @transcriptionFactors.count == 0 ? 1 : @finishedFactorCount

    @pieChartData = [@inactiveFactorCount / @transcriptionFactorCount*100, @processingFactorCount / @transcriptionFactorCount*100, @finishedFactorCount / @transcriptionFactorCount*100]
  end
end
