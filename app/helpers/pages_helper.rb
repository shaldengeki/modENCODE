module PagesHelper
  def getCompletionProgress
    @transcriptionFactors = TranscriptionFactor.all
    @finishedFactorCount = TranscriptionFactor.joins(:isoforms => {:reagents => {:attempts => :statuses}}).where(:statuses => {:end => true}).count(:transcription_factor_id, :distinct => true) * 1.0
    @processingFactorCount = TranscriptionFactor.joins(:isoforms => {:reagents => {:attempts => :statuses}}).where(:statuses => {:end => false}).count(:transcription_factor_id, :distinct => true) - @finishedFactorCount * 1.0
    @inactiveFactorCount = @transcriptionFactors.count - @processingFactorCount

    @transcriptionFactorCount = @transcriptionFactors.count == 0 ? 1 : @transcriptionFactors.count
    @finishedFactorCount = @transcriptionFactors.count == 0 ? 1 : @finishedFactorCount

    @pieChartData = [(@inactiveFactorCount/@transcriptionFactorCount*100).round(2), (@processingFactorCount/@transcriptionFactorCount*100).round(2), (@finishedFactorCount/@transcriptionFactorCount*100).round(2)]
  end
end
