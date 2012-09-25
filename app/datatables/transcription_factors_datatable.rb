class TranscriptionFactorsDatatable
  include ActionView::Helpers::TagHelper
  include ActionView::Helpers::FormTagHelper
  include ActionView::Helpers::FormOptionsHelper
  delegate :params, :h, :link_to, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: TranscriptionFactor.count,
      iTotalDisplayRecords: transcription_factors.total_entries,
      aaData: data
    }
  end

private

  def data
    transcription_factors.map do |transcription_factor|
      [
        number_field_tag("transcription_factors_select_list" + "[" + transcription_factor.id.to_s + "]", nil, :min => 0, :step => 1),
        # transcription_factor.id,
        h(transcription_factor.gene_type.name),
        h(transcription_factor.name),
        transcription_factor.aliases.map{|this_alias| this_alias.name}.join(", ")
      ]
    end
  end

  def transcription_factors
    @transcription_factors ||= fetch_transcription_factors
  end

  def fetch_transcription_factors
    transcription_factors = TranscriptionFactor.order("#{sort_column} #{sort_direction}")
    transcription_factors = transcription_factors.page(page).per_page(per_page)
    if params[:sSearch].present?
      transcription_factors = transcription_factors.where("name like :search or flybase_id like :search or cg_id like :search or refseq_id like :search or entrez_id like :search or hgnc_id like :search or ensembl_id like :search", search: "%#{params[:sSearch]}%")
    end
    transcription_factors
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[name category released_on price]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end