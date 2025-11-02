CREATE TABLE [datatype] (
  [data_type_code] tinyint PRIMARY KEY,
  [data_type_text] nvarchar
)
GO

CREATE TABLE [footnote] (
  [footnote_code] nvarchar PRIMARY KEY,
  [footnote_text] nvarchar
)
GO

CREATE TABLE [industry] (
  [id] smallint PRIMARY KEY,
  [industry_code] bigint,
  [naics_code] nvarchar,
  [publishing_status] nvarchar,
  [industry_name] nvarchar,
  [display_level] float,
  [selectable] nvarchar,
  [sort_sequence] float
)
GO

CREATE TABLE [period] (
  [period_code] nvarchar PRIMARY KEY,
  [month_abbr] nvarchar,
  [month] nvarchar
)
GO

CREATE TABLE [seasonal] (
  [industry_code] nvarchar PRIMARY KEY,
  [seasonal_text] nvarchar
)
GO

CREATE TABLE [supersector] (
  [supersector_code] tinyint PRIMARY KEY,
  [supersector_name] nvarchar
)
GO

CREATE TABLE [series] (
  [series_id] nvarchar PRIMARY KEY,
  [supersector_code] bigint,
  [industry_code] nvarchar,
  [data_type_code] bigint,
  [seasonal] nvarchar,
  [series_title] nvarchar
)
GO

CREATE TABLE [annual] (
  [id] smallint PRIMARY KEY,
  [series_id] nvarchar,
  [year] smallint,
  [period] nvarchar,
  [value] float,
  [footnote_codes] nvarchar,
  [original_file] nvarchar
)
GO

ALTER TABLE [annual] ADD FOREIGN KEY ([series_id]) REFERENCES [series] ([series_id])
GO

ALTER TABLE [annual] ADD FOREIGN KEY ([period]) REFERENCES [period] ([period_code])
GO

ALTER TABLE [series] ADD FOREIGN KEY ([supersector_code]) REFERENCES [supersector] ([supersector_code])
GO

ALTER TABLE [series] ADD FOREIGN KEY ([industry_code]) REFERENCES [industry] ([industry_code])
GO

ALTER TABLE [series] ADD FOREIGN KEY ([data_type_code]) REFERENCES [datatype] ([data_type_code])
GO

ALTER TABLE [series] ADD FOREIGN KEY ([seasonal]) REFERENCES [seasonal] ([industry_code])
GO

ALTER TABLE [annual] ADD FOREIGN KEY ([footnote_codes]) REFERENCES [footnote] ([footnote_code])
GO
