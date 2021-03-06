# rails generate scaffold WebResource name:string title:string body:text key:string weight:integer
# rails generate scaffold Lawsuit name:string weight:integer subcategory:references webresource:references
# rails generate scaffold TextStyle name:string weight:integer tag:integer margin_left:integer text_align:integer strong:boolean underline:boolean italic:boolean
# rails generate scaffold BlockField name:string text:string weight:integer data_type:integer marker:string
# rails generate scaffold BlockGroup name:string weight:integer
# rails generate scaffold Block name:string weight:integer include_type:integer content_type:integer block_field:references field_group:references
# rails generate scaffold BlockPart name:string text:text  weight:integer text_style:references block:references
# rails generate scaffold LawsuitBlock weight:integer lawsuit:references block:references
// No text styles are needed, as all are custom
# rails destroy scaffold TextStyle
# rails generate BlockFieldBlockPart block_field:references block_part:references
# rails generate scaffold BlockSubgroup name:string weight:integer block_group:references

https://github.com/rroblak/seed_dump

# set env variable
rails db:environment:set RAILS_ENV=development

# many to many example
class Physician < ApplicationRecord
  has_many :appointments
  has_many :patients, through: :appointments
end
class Appointment < ApplicationRecord
  belongs_to :physician
  belongs_to :patient
end
class Patient < ApplicationRecord
  has_many :appointments
  has_many :physicians, through: :appointments
end
# new  files list example
  invoke  active_record
  create    db/migrate/20161201120415_create_webresources.rb
  create    app/models/webresource.rb
  invoke    test_unit
  create      test/models/webresource_test.rb
  create      test/fixtures/webresources.yml
  invoke  resource_route
   route    resources :webresources
  invoke  scaffold_controller
  create    app/controllers/webresources_controller.rb
  invoke    erb
  create      app/views/webresources
  create      app/views/webresources/index.html.erb
  create      app/views/webresources/edit.html.erb
  create      app/views/webresources/show.html.erb
  create      app/views/webresources/new.html.erb
  create      app/views/webresources/_form.html.erb
  invoke    test_unit
  create      test/controllers/webresources_controller_test.rb
  invoke    helper
  create      app/helpers/webresources_helper.rb
  invoke      test_unit
  invoke    jbuilder
  create      app/views/webresources/index.json.jbuilder
  create      app/views/webresources/show.json.jbuilder
  create      app/views/webresources/_webresource.json.jbuilder
  invoke  assets
  invoke    coffee
  create      app/assets/javascripts/webresources.coffee
  invoke    scss
  create      app/assets/stylesheets/webresources.scss
  invoke  scss
  create    app/assets/stylesheets/scaffolds.scss

# GIT
git config --global user.name |email
#RAILS DB
#This will reset your database and reload your current schema with all:
rake (db:reset = rake db:drop db:schema:load db:seed maybe + =>) db:migrate
#This will destroy your db and then create it and then migrate your current schema:
rake db:drop(purge) db:create db:migrate
#You will also need to run rake db:test:prepare = (RAILS_ENV=test rake db:seed)for testing
###################################################
db:migrate runs (single) migrations that have not run yet.
db:create creates the database
db:drop deletes the database
db:schema:load creates tables and columns within the (existing) database following schema.rb
db:setup does db:create, db:schema:load, db:seed
db:reset does db:drop, db:setup
Typically, you would use db:migrate after having made changes to the schema via new migration files (this makes sense only if there is already data in the database). db:schema:load is used when you setup a new instance of your app.

I hope that helps.

UPDATE for rails 3:
I just checked the source and the dependencies are like this now:
db:create creates the database for the current env
db:create:all creates the databases for all envs
db:drop drops the database for the current env
db:drop:all drops the databases for all envs
db:migrate runs migrations for the current env that have not run yet
db:migrate:up runs one specific migration
db:migrate:down rolls back one specific migration
db:migrate:status shows current migration status
db:rollback rolls back the last migration
db:forward advances the current schema version to the next one
db:seed (only) runs the db/seed.rb file
db:schema:load loads the schema into the current env's database
db:schema:dump dumps the current env's schema (and seems to create the db as well)
db:setup runs db:schema:load, db:seed
db:reset runs db:drop db:setup
db:migrate:redo runs (db:migrate:down db:migrate:up) or (db:rollback db:migrate) depending on the specified migration
db:migrate:reset runs db:drop db:create db:migrate
For further information please have a look at https://github.com/rails/rails/blob/v3.2.12/activerecord/lib/active_record/railties/databases.rake (for Rails 3.2.x) and https://github.com/rails/rails/blob/v4.0.5/activerecord/lib/active_record/railties/databases.rake (for Rails 4.0.x)

# User login https://www.railstutorial.org/book/basic_login

##################################################

TSQL SCRIPT FOR ORIGINAL DB
USE [LawsuitDB]
GO
/****** Object:  Table [dbo].[Blocks]    Script Date: 11/22/2016 9:05:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blocks](
	[BlockId] [int] IDENTITY(1,1) NOT NULL,
	[BlockName] [nvarchar](50) NOT NULL,
	[BlockIncludeType] [int] NOT NULL CONSTRAINT [DF_Blocks_BlockType]  DEFAULT ((0)),
	[BlockWeight] [int] NOT NULL CONSTRAINT [DF_Blocks_BlockWeight]  DEFAULT ((0)),
	[BlockContentType] [int] NOT NULL CONSTRAINT [DF_Blocks_BlockContentType]  DEFAULT ((0)),
	[FieldId] [int] NULL CONSTRAINT [DF_Blocks_FieldId]  DEFAULT ((0)),
	[GroupId] [int] NOT NULL,
 CONSTRAINT [PK_Blocks] PRIMARY KEY CLUSTERED 
(
	[BlockId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Categories]    Script Date: 11/22/2016 9:05:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](50) NOT NULL,
	[CategoryWeight] [int] NOT NULL CONSTRAINT [DF_Categories_CtegoryWeight]  DEFAULT ((0)),
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Fields]    Script Date: 11/22/2016 9:05:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fields](
	[FieldId] [int] IDENTITY(1,1) NOT NULL,
	[FieldName] [nvarchar](50) NOT NULL,
	[FieldDataType] [int] NOT NULL,
	[FieldText] [nvarchar](150) NOT NULL,
	[FieldMarker] [nvarchar](150) NULL,
	[FieldWeight] [int] NOT NULL CONSTRAINT [DF_Fields_FieldType]  DEFAULT ((0)),
 CONSTRAINT [PK_Fields] PRIMARY KEY CLUSTERED 
(
	[FieldId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Groups]    Script Date: 11/22/2016 9:05:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Groups](
	[GroupId] [int] IDENTITY(1,1) NOT NULL,
	[GroupName] [nvarchar](150) NOT NULL,
	[GroupWeight] [int] NOT NULL CONSTRAINT [DF_Groups_GroupWeight]  DEFAULT ((0)),
 CONSTRAINT [PK_Groups] PRIMARY KEY CLUSTERED 
(
	[GroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LawsuitBlock]    Script Date: 11/22/2016 9:05:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LawsuitBlock](
	[RelationId] [int] IDENTITY(1,1) NOT NULL,
	[LawsuitId] [int] NOT NULL,
	[BlockId] [int] NOT NULL,
	[LawsuitBlockWeight] [int] NOT NULL CONSTRAINT [DF_LawsuitBlock_BlockWeight]  DEFAULT ((0)),
 CONSTRAINT [PK_LawsuitBlock] PRIMARY KEY CLUSTERED 
(
	[LawsuitId] ASC,
	[BlockId] ASC,
	[RelationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Lawsuits]    Script Date: 11/22/2016 9:05:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lawsuits](
	[LawsuitId] [int] IDENTITY(1,1) NOT NULL,
	[LawsuitName] [nvarchar](50) NOT NULL,
	[SubCategoryId] [int] NOT NULL,
	[LawsuitWeight] [int] NOT NULL,
	[WebResourceId] [int] NULL,
 CONSTRAINT [PK_Lawsuits] PRIMARY KEY CLUSTERED 
(
	[LawsuitId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Parts]    Script Date: 11/22/2016 9:05:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Parts](
	[PartId] [int] IDENTITY(1,1) NOT NULL,
	[PartName] [nvarchar](50) NOT NULL,
	[PartText] [nvarchar](max) NOT NULL,
	[TextStyleId] [int] NOT NULL,
	[PartWeight] [int] NOT NULL,
	[BlockId] [int] NOT NULL,
 CONSTRAINT [PK_Parts] PRIMARY KEY CLUSTERED 
(
	[PartId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SubCategories]    Script Date: 11/22/2016 9:05:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubCategories](
	[SubCategoryId] [int] IDENTITY(1,1) NOT NULL,
	[SubCategoryName] [nvarchar](50) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[SubCategoryWeight] [int] NOT NULL CONSTRAINT [DF_SubCategories_SubCategoryWeight]  DEFAULT ((0)),
 CONSTRAINT [PK_SubCategories] PRIMARY KEY CLUSTERED 
(
	[SubCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TextStyles]    Script Date: 11/22/2016 9:05:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TextStyles](
	[TextStyleId] [int] IDENTITY(1,1) NOT NULL,
	[TextStyleName] [nvarchar](50) NOT NULL,
	[TextStyleWeight] [int] NOT NULL CONSTRAINT [DF_BlockStyles_BlockStyleWeight]  DEFAULT ((0)),
	[TextStyleTag] [int] NOT NULL CONSTRAINT [DF_BlockStyles_BlockStyleTag]  DEFAULT ((0)),
	[TextStyleMarginLeft] [int] NOT NULL CONSTRAINT [DF_BlockStyles_BlockStyleMarginLeft]  DEFAULT ((0)),
	[TextStyleTextAlign] [int] NOT NULL CONSTRAINT [DF_BlockStyles_BlockStyleTextAlign]  DEFAULT ((0)),
	[TextStyleStong] [bit] NOT NULL CONSTRAINT [DF_BlockStyles_BlockStyleStong]  DEFAULT ((0)),
	[TextStyleUnderline] [bit] NOT NULL CONSTRAINT [DF_BlockStyles_BlockStyleUnderline]  DEFAULT ((0)),
	[TextStyleItalic] [bit] NOT NULL CONSTRAINT [DF_BlockStyles_BlockStyleItalic]  DEFAULT ((0)),
 CONSTRAINT [PK_BlockStyles] PRIMARY KEY CLUSTERED 
(
	[TextStyleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserProfile]    Script Date: 11/22/2016 9:05:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserProfile](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](56) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserProfiles]    Script Date: 11/22/2016 9:05:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserProfiles](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](56) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[WebResource]    Script Date: 11/22/2016 9:05:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WebResource](
	[WebResourceId] [int] IDENTITY(1,1) NOT NULL,
	[WebResourceTitle] [nvarchar](150) NOT NULL,
	[WebResourceBody] [nvarchar](max) NOT NULL,
	[WebResourceKey] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_WebResource] PRIMARY KEY CLUSTERED 
(
	[WebResourceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UK_WebResource] UNIQUE NONCLUSTERED 
(
	[WebResourceKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
ALTER TABLE [dbo].[Blocks]  WITH CHECK ADD  CONSTRAINT [FK_Blocks_Fields] FOREIGN KEY([FieldId])
REFERENCES [dbo].[Fields] ([FieldId])
GO
ALTER TABLE [dbo].[Blocks] CHECK CONSTRAINT [FK_Blocks_Fields]
GO
ALTER TABLE [dbo].[Blocks]  WITH CHECK ADD  CONSTRAINT [FK_Blocks_Groups] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Groups] ([GroupId])
GO
ALTER TABLE [dbo].[Blocks] CHECK CONSTRAINT [FK_Blocks_Groups]
GO
ALTER TABLE [dbo].[LawsuitBlock]  WITH CHECK ADD  CONSTRAINT [FK_LawsuitBlock_Blocks] FOREIGN KEY([BlockId])
REFERENCES [dbo].[Blocks] ([BlockId])
GO
ALTER TABLE [dbo].[LawsuitBlock] CHECK CONSTRAINT [FK_LawsuitBlock_Blocks]
GO
ALTER TABLE [dbo].[LawsuitBlock]  WITH CHECK ADD  CONSTRAINT [FK_LawsuitBlocks_Lawsuits] FOREIGN KEY([LawsuitId])
REFERENCES [dbo].[Lawsuits] ([LawsuitId])
GO
ALTER TABLE [dbo].[LawsuitBlock] CHECK CONSTRAINT [FK_LawsuitBlocks_Lawsuits]
GO
ALTER TABLE [dbo].[Lawsuits]  WITH CHECK ADD  CONSTRAINT [FK_Lawsuits_SubCategories] FOREIGN KEY([SubCategoryId])
REFERENCES [dbo].[SubCategories] ([SubCategoryId])
GO
ALTER TABLE [dbo].[Lawsuits] CHECK CONSTRAINT [FK_Lawsuits_SubCategories]
GO
ALTER TABLE [dbo].[Lawsuits]  WITH CHECK ADD  CONSTRAINT [FK_Lawsuits_WebResource] FOREIGN KEY([WebResourceId])
REFERENCES [dbo].[WebResource] ([WebResourceId])
GO
ALTER TABLE [dbo].[Lawsuits] CHECK CONSTRAINT [FK_Lawsuits_WebResource]
GO
ALTER TABLE [dbo].[Parts]  WITH CHECK ADD  CONSTRAINT [FK_Parts_Blocks] FOREIGN KEY([BlockId])
REFERENCES [dbo].[Blocks] ([BlockId])
GO
ALTER TABLE [dbo].[Parts] CHECK CONSTRAINT [FK_Parts_Blocks]
GO
ALTER TABLE [dbo].[Parts]  WITH CHECK ADD  CONSTRAINT [FK_Parts_TextStyles] FOREIGN KEY([TextStyleId])
REFERENCES [dbo].[TextStyles] ([TextStyleId])
GO
ALTER TABLE [dbo].[Parts] CHECK CONSTRAINT [FK_Parts_TextStyles]
GO
ALTER TABLE [dbo].[SubCategories]  WITH CHECK ADD  CONSTRAINT [FK_SubCategory_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([CategoryId])
GO
ALTER TABLE [dbo].[SubCategories] CHECK CONSTRAINT [FK_SubCategory_Category]
GO