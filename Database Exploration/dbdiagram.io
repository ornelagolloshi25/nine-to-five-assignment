Table datatype {
  data_type_code tinyint
  data_type_text	nvarchar
}

Table footnote {
  footnote_code	nvarchar
  footnote_text	nvarchar
}

Table industry {
  id	smallint [primary key]
  industry_code	bigint
  naics_code	nvarchar
  publishing_status	nvarchar
  industry_name	nvarchar
  display_level	float
  selectable	nvarchar
  sort_sequence	float
}

Table period {
  period_code	nvarchar
  month_abbr	nvarchar
  month	nvarchar
}

Table seasonal {
  industry_code	nvarchar
  seasonal_text	nvarchar
}

Table supersector {
  supersector_code	tinyint
  supersector_name	nvarchar
}

Table series {
  series_id	nvarchar [primary key]
  supersector_code	bigint
  industry_code	nvarchar
  data_type_code	bigint
  seasonal	nvarchar
  series_title	nvarchar
}

Table annual {
  id	smallint [primary key]
  series_id	nvarchar
  year	smallint
  period	nvarchar
  value	float
  footnote_codes	nvarchar
  original_file	nvarchar
}