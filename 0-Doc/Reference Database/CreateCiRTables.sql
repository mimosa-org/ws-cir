Use TestCIR;

-- Test database defined from the Common Interoperability Registry Model specification
-- Does not include integrity constraints or automatic identity assignment
-- Commented lines define the integrity constraints that should be applied after verification
-- Restrictions:
--		One description per registry
--		One ISO15926 reference per category
--		One userDescription per Entry
--		One value per property

Create Table CiRRegistry(
	RegistryID bigint PRIMARY KEY,			-- Locally unique to this CIR Registry database
	ID nchar(1024) not null,			-- Defined by the service user
	GUID UNIQUEIDENTIFIER DEFAULT NEWSEQUENTIALID (), -- Assigned by the service
	DateCreated datetime				-- Assigned by the service
);

Create Table CiRCategory(
	CategoryID bigint identity(1,1) PRIMARY KEY,	-- Locally unique to this CIR Registry database
	RegistryID bigint references CiRRegistry(RegistryID) not null, -- FK to CiRRegistry
	ID nchar(1024) not null,			-- Defined by the service user
	CategorySourceID nchar(256),			-- Defined by service user
	UserDescription varchar (1024),			-- Defined by the service user
	ISO15926ObjectReferenceURI char(256)		-- Defined by the service user
);

Create Table CiREntry(
	EntryID bigint PRIMARY KEY,			-- Locally unique to this CIR Registry database
	CategoryID bigint references CiRCategory(CategoryID) not null,	-- FK to CiRCategory
	EntryIDinSource nchar(256) not null,		-- Defined by the service user
	SourceID nchar(256) not null,			-- Defined by the service user
	CIRID UNIQUEIDENTIFIER,				-- Assigned by the service user when equivalencies found
	SourceOwnerID nchar(256),			-- Defined by the service user
	UserDescription varchar (1024),			-- Defined by the service user
	UserTag nchar(256),				-- Defined by the service user
	InActive int					-- Defined by the service user
);

Create Table CiRProperty(
	PropertyID bigint PRIMARY KEY,			-- Locally unique to this CIR Registry database
	EntryID bigint references CiREntry(EntryID) not null,  -- FK to CiREntry
	ID nchar(1024) not null,			-- Defined by the service user
	CurrentValue nchar(256),			-- Defined by the service user
	DataType nchar(256),				-- Defined by the service user
	UOM nchar(256),					-- Defined by the service user
	Mandatory int					-- Defined by the service user
);


