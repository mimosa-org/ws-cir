use TestCIR;

insert into CirRegistry (RegistryID,ID)
	values (1,'www.openoandm.org/CIRTest');

insert into CiRCategory (CategoryID, RegistryID, ID, CategorySourceID, UserDescription)
	values (1,1,'Asset_Type', 'www.mimosa.org/osa-eai/cris_v3_2','Types of Assets');
	
insert into CiREntry (EntryID, CategoryID, EntityIDinSource, SourceID, CIRID, SourceOwnerID, UserDescription, UserTag, InActive)
	values (1,1,130,'[OSA-EAI-CRIS-REF-XML-V03-2]',null, 'www.mimosa.org', 'Motor','Motor',1);
	
insert into CirProperty (PropertyID, EntryID, ID, CurrentValue, DataType, UOM, Mandatory)
	values (1,1,'Abbreviation', 'MTR',null,0);
		
	