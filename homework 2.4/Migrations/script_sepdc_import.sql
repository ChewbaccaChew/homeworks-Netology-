DECLARE @id_ds AS INT, @DSRefRecup AS VARCHAR(8000), @DSRef AS varchar(8000), @idr_fin AS INT, @fin AS VARCHAR(8000), @mp AS VARCHAR(8000), @idr_mp AS INT, @idr_mod AS INT, @EDDReference AS VARCHAR(8000)
DECLARE @EDDOption AS VARCHAR (8000),	
        @TypeACDC AS VARCHAR (8000),
		@EDDMOD AS VARCHAR (8000),
        @Side AS VARCHAR (8000),
        @Rating AS VARCHAR (8000),
        @nbrPhase AS VARCHAR (8000),
        @SSPCAllocatedCardFin AS VARCHAR (8000),
        @SSPCTypeCard AS VARCHAR (8000),
        @SubBusBar AS VARCHAR (8000),
        @ReferenceConnector AS VARCHAR (8000),
        @DIActive AS VARCHAR (8000),
        @GFIEnabled AS VARCHAR (8000),
        @DiscreteOutput AS VARCHAR (8000),
        @Group_ AS VARCHAR (8000),        
        @Busbar AS VARCHAR (8000),
        @PowerCenter AS VARCHAR (8000),
        @GroundServiceSupply AS VARCHAR (8000), 
        @SSPCChannels AS VARCHAR (8000),
        @PinAllocation AS VARCHAR (8000),
        @AllocatedPhASe AS VARCHAR (8000),
        @FullProvisionStatus AS VARCHAR (8000),
        @PCDStatCon AS VARCHAR (8000),
        @PCDStatPin AS VARCHAR (8000),
        @BackUpValueStatus AS VARCHAR (8000),
        @DefaultStatus AS VARCHAR (8000),
        @TypeOfProtection AS VARCHAR (8000),
        @PowerCenterType AS VARCHAR (8000),
        @ClASsification AS VARCHAR (8000),
        @OperationalBehaviour AS VARCHAR (8000),
        @powerfactor AS VARCHAR (8000),
        @NominalPower AS VARCHAR (8000),
        @NPP1 AS VARCHAR (8000),
        @NPP2 AS VARCHAR (8000),
        @NPP3 AS VARCHAR (8000),
        @Sheddable AS VARCHAR (8000),
        @Monitored AS VARCHAR (8000),
        @SecuredOpen AS VARCHAR (8000),
        @FlightPriority AS VARCHAR (8000),
        @Priority AS VARCHAR (8000),
        @SysFPriority AS VARCHAR (8000),
        @SysGPriority AS VARCHAR (8000),
        @GroundServMax AS VARCHAR (8000),  
        @TurnAround0015Max AS VARCHAR (8000),
        @TurnAround1530Max AS VARCHAR (8000),
        @TurnAround3045Max AS VARCHAR (8000),
        @TurnAround4560Max AS VARCHAR (8000),
        @TurnAround6075Max AS VARCHAR (8000),
        @TurnAround7590Max AS VARCHAR (8000),
        @TurnAround90105Max AS VARCHAR (8000),
        @TurnAround105120Max AS VARCHAR (8000),
        @TurnAround120135Max AS VARCHAR (8000),
        @TurnAround135150Max AS VARCHAR (8000),
        @TurnAround0015Op AS VARCHAR (8000),
        @TurnAround1530Op AS VARCHAR (8000),
        @TurnAround3045Op AS VARCHAR (8000),
        @TurnAround4560Op AS VARCHAR (8000),
        @TurnAround6075Op AS VARCHAR (8000),
        @TurnAround7590Op AS VARCHAR (8000),
        @TurnAround90105Op AS VARCHAR (8000),
        @TurnAround105120Op AS VARCHAR (8000),
        @TurnAround120135Op AS VARCHAR (8000),
        @TurnAround135150Op AS VARCHAR (8000),
        @PushBackMax AS VARCHAR (8000),
        @StartMax AS VARCHAR (8000),
        @RollMax AS VARCHAR (8000),
        @TakeOffMax AS VARCHAR (8000),
        @ClimbMax AS VARCHAR (8000),
        @CruiseMax AS VARCHAR (8000),
        @DescentMax AS VARCHAR (8000),
        @LandingMax AS VARCHAR (8000),
        @TaxiMax AS VARCHAR (8000),
        @SpareMax AS VARCHAR (8000),
        @EmerConfMax AS VARCHAR (8000),
        @EmerConfOutMax AS VARCHAR (8000),
        @BatConfMax AS VARCHAR (8000),
        @GroundServOp AS VARCHAR (8000), 
        @PushBackOp AS VARCHAR (8000),
        @StartOp AS VARCHAR (8000),
        @RollOp AS VARCHAR (8000),
        @TakeOffOp AS VARCHAR (8000),
        @ClimbOp AS VARCHAR (8000),
        @CruiseOp AS VARCHAR (8000),
        @DescentOp AS VARCHAR (8000),
        @LandingOp AS VARCHAR (8000),
        @TaxiOp AS VARCHAR (8000),
        @SpareOp AS VARCHAR (8000),
        @EmerConfOp AS VARCHAR (8000),
        @EmerConfOutOp AS VARCHAR (8000),
        @BatConfOp AS VARCHAR (8000)

DECLARE CURSOR_idr_FIN_CI CURSOR FOR
SELECT 
	    SEPDCPowerSupply.[SSPCFIN] ,	
	    SEPDCPowerSupply.[MP] ,
	    SEPDCPowerSupply.[EDDMOD] ,
        SEPDCPowerSupply.[EDDOption] ,
        SEPDCPowerSupply.[TypeACDC] ,
        SEPDCPowerSupply.[Side] ,
        SEPDCPowerSupply.[Rating] ,
        SEPDCPowerSupply.[nbr de phase] ,
        SEPDCPowerSupply.[SSPCAllocatedCardFin] ,
        SEPDCPowerSupply.[SSPCTypeCard] ,
        SEPDCPowerSupply.[SubBusBar] ,
        SEPDCPowerSupply.[ReferenceConnector] ,
        SEPDCPowerSupply.[DIActive] ,
        SEPDCPowerSupply.[GFIEnabled] ,
        SEPDCPowerSupply.[DiscreteOutput] ,
        SEPDCPowerSupply.[Group_] ,        
        SEPDCPowerSupply.[Busbar] ,
        SEPDCPowerSupply.[Power Center] ,
        SEPDCPowerSupply.[GroundServiceSupply] , 
        SEPDCPowerSupply.[SSPCChannels] ,
        SEPDCPowerSupply.[PinAllocation] ,
        SEPDCPowerSupply.[AllocatedPhase] ,
        SEPDCPowerSupply.[FullProvisionStatus] ,
        SEPDCPowerSupply.[PCDStatCon] ,
        SEPDCPowerSupply.[PCDStatPin] ,
        SEPDCPowerSupply.[BackUpValueStatus] ,
        SEPDCPowerSupply.[Default Status] ,
        SEPDCPowerSupply.[TypeOfProtection] ,
        SEPDCPowerSupply.[Power Center Type] ,
        SEPDCPowerSupply.[Classification] ,
        SEPDCPowerSupply.[OperationalBehaviour] ,
        SEPDCPowerSupply.[power factor] ,
        SEPDCPowerSupply.[NominalPower] ,
        SEPDCPowerSupply.[NPP1] ,
        SEPDCPowerSupply.[NPP2] ,
        SEPDCPowerSupply.[NPP3] ,
        SEPDCPowerSupply.[Sheddable] ,
        SEPDCPowerSupply.[Monitored] ,
        SEPDCPowerSupply.[SecuredOpen] ,
        SEPDCPowerSupply.[FlightPriority] ,
        SEPDCPowerSupply.[Priority] ,
        SEPDCPowerSupply.[SysFPriority] ,
        SEPDCPowerSupply.[SysGPriority] ,
        SEPDCPowerSupply.[GroundServMax] ,  
        SEPDCPowerSupply.[TurnAround0015Max] ,
        SEPDCPowerSupply.[TurnAround1530Max] ,
        SEPDCPowerSupply.[TurnAround3045Max] ,
        SEPDCPowerSupply.[TurnAround4560Max] ,
        SEPDCPowerSupply.[TurnAround6075Max] ,
        SEPDCPowerSupply.[TurnAround7590Max] ,
        SEPDCPowerSupply.[TurnAround90105Max] ,
        SEPDCPowerSupply.[TurnAround105120Max] ,
        SEPDCPowerSupply.[TurnAround120135Max] ,
        SEPDCPowerSupply.[TurnAround135150Max] ,
        SEPDCPowerSupply.[TurnAround0015Op] ,
        SEPDCPowerSupply.[TurnAround1530Op] ,
        SEPDCPowerSupply.[TurnAround3045Op] ,
        SEPDCPowerSupply.[TurnAround4560Op] ,
        SEPDCPowerSupply.[TurnAround6075Op] ,
        SEPDCPowerSupply.[TurnAround7590Op] ,
        SEPDCPowerSupply.[TurnAround90105Op] ,
        SEPDCPowerSupply.[TurnAround105120Op] ,
        SEPDCPowerSupply.[TurnAround120135Op] ,
        SEPDCPowerSupply.[TurnAround135150Op] ,
        SEPDCPowerSupply.[PushBackMax] ,
        SEPDCPowerSupply.[StartMax] ,
        SEPDCPowerSupply.[RollMax] ,
        SEPDCPowerSupply.[TakeOffMax] ,
        SEPDCPowerSupply.[ClimbMax] ,
        SEPDCPowerSupply.[CruiseMax] ,
        SEPDCPowerSupply.[DescentMax] ,
        SEPDCPowerSupply.[LandingMax] ,
        SEPDCPowerSupply.[TaxiMax] ,
        SEPDCPowerSupply.[SpareMax] ,
        SEPDCPowerSupply.[EmerConfMax] ,
        SEPDCPowerSupply.[EmerConfOutMax] ,
        SEPDCPowerSupply.[BatConfMax] ,
        SEPDCPowerSupply.[GroundServOp] , 
        SEPDCPowerSupply.[PushBackOp] ,
        SEPDCPowerSupply.[StartOp] ,
        SEPDCPowerSupply.[RollOp] ,
        SEPDCPowerSupply.[TakeOffOp] ,
        SEPDCPowerSupply.[ClimbOp] ,
        SEPDCPowerSupply.[CruiseOp] ,
        SEPDCPowerSupply.[DescentOp] ,
        SEPDCPowerSupply.[LandingOp] ,
        SEPDCPowerSupply.[TaxiOp] ,
        SEPDCPowerSupply.[SpareOp] ,
        SEPDCPowerSupply.[EmerConfOp] ,
        SEPDCPowerSupply.[EmerConfOutOp] ,
        SEPDCPowerSupply.[BatConfOp] 
FROM SEPDCPowerSupply


OPEN CURSOR_idr_FIN_CI
-- Perform the first fetch.
FETCH NEXT FROM CURSOR_idr_FIN_CI INTO
	
	@FIN,
	@mp,
	@EDDMOD,
	@EDDOption,
	@TypeACDC,
        @Side,
        @Rating,
        @nbrPhase,
        @SSPCAllocatedCardFin,
        @SSPCTypeCard,
        @SubBusBar,
        @ReferenceConnector,
        @DIActive,
        @GFIEnabled,
        @DiscreteOutput,
        @Group_,        
        @Busbar,
        @PowerCenter,
        @GroundServiceSupply, 
        @SSPCChannels,
        @PinAllocation,
        @AllocatedPhASe,
        @FullProvisionStatus,
        @PCDStatCon,
        @PCDStatPin,
        @BackUpValueStatus,
        @DefaultStatus,
        @TypeOfProtection,
        @PowerCenterType,
        @ClASsification,
        @OperationalBehaviour,
        @powerfactor,
        @NominalPower,
        @NPP1,
        @NPP2,
        @NPP3,
        @Sheddable,
        @Monitored,
        @SecuredOpen,
        @FlightPriority,
        @Priority,
        @SysFPriority,
        @SysGPriority,
        @GroundServMax,  
        @TurnAround0015Max,
        @TurnAround1530Max,
        @TurnAround3045Max,
        @TurnAround4560Max,
        @TurnAround6075Max,
        @TurnAround7590Max,
        @TurnAround90105Max,
        @TurnAround105120Max,
        @TurnAround120135Max,
        @TurnAround135150Max,
        @TurnAround0015Op,
        @TurnAround1530Op,
        @TurnAround3045Op,
        @TurnAround4560Op,
        @TurnAround6075Op,
        @TurnAround7590Op,
        @TurnAround90105Op,
        @TurnAround105120Op,
        @TurnAround120135Op,
        @TurnAround135150Op,
        @PushBackMax,
        @StartMax,
        @RollMax,
        @TakeOffMax,
        @ClimbMax,
        @CruiseMax,
        @DescentMax,
        @LandingMax,
        @TaxiMax,
        @SpareMax,
        @EmerConfMax,
        @EmerConfOutMax,
        @BatConfMax,
        @GroundServOp, 
        @PushBackOp,
        @StartOp,
        @RollOp,
        @TakeOffOp,
        @ClimbOp,
        @CruiseOp,
        @DescentOp,
        @LandingOp,
        @TaxiOp,
        @SpareOp,
        @EmerConfOp,
        @EmerConfOutOp,
        @BatConfOp

WHILE @@FETCH_STATUS = 0
BEGIN  

	SET @idr_fin = ''
	SET @idr_mp = ''
	
	
	-- GET FIN id
	SELECT @idr_fin = id_fin 
	FROM R_FIN_CI
	WHERE R_FIN_CI.FIN = @FIN
	
	print @FIN
	print @idr_fin
	
	-- Get MP id
	SELECT @idr_mp = id_MP 
	FROM T_MP
	WHERE T_MP.MPReference = @mp
	
	SET @id_ds = ''

	-- Test si l'EDD est d???j??? pr???sent
	SELECT @id_ds = id_ds FROM R_FIN_DS
	WHERE idr_fin = @idr_fin
	AND idr_mp = @idr_mp
	
	SET @DSRefRecup = ''
	select @DSRefRecup = max(DS_SI_Reference) + 1 from R_FIN_DS where idr_fin = @idr_fin and idr_mp = @idr_mp
	IF @DSRefRecup ='' or @DSRefRecup is null
	BEGIN
		SET @DSRef = '0001'
	END 
	ELSE
	BEGIN
		Set @DSRef = '000' + @DSRefRecup
	END
	SELECT
		@EDDReference = ATACode + Circuit_Letter + SEPDCPowerSupply.[TypeACDC] +
		REPLICATE('0', 6 - LEN(CONVERT(VARCHAR(8000), ISNULL((SELECT MAX(CONVERT(INTEGER, SUBSTRING(EDDReference, 9, 6)) + 1) FROM R_FIN_DS WHERE LEFT(EDDReference, 4) = ATACode), 0)))) + CONVERT(VARCHAR(8000),ISNULL((SELECT MAX(CONVERT(INTEGER, SUBSTRING(EDDReference, 9, 6)) + 1) FROM R_FIN_DS WHERE LEFT(EDDReference, 4) = ATACode), 0))
		+ 'V000'
	FROM
		SEPDCPowerSupply
	        JOIN R_FIN_CI ON R_FIN_CI.FIN = SEPDCPowerSupply.[SSPCFIN]
	        JOIN R_ATA ON R_ATA.id_ata = R_FIN_CI.idr_ata
	WHERE R_FIN_CI.FIN = @FIN


	Select @REFDS = max(DS_SI_Reference) from R_FIN_DS where id_ds = @id_ds
	SET @REFDS = '000' + @REFDS
	 
IF @id_ds <= 0 or @id_ds is null
BEGIN
	PRINT 'INSERTION'
	PRINT @MP
	PRINT @FIN
    INSERT INTO R_FIN_DS
    (
         DS_DI_Reference,
         EDDReference,
        idr_fin,
        R_FIN_DS.EDDMOD,
            R_FIN_DS.EDDOption,
            R_FIN_DS.TypeACDC,
            R_FIN_DS.Side,
            R_FIN_DS.Rating,
            R_FIN_DS.TypePhase,
            R_FIN_DS.SSPCAllocatedCardFin,
            R_FIN_DS.SSPCTypeCard,
            R_FIN_DS.SubBusBar,
            R_FIN_DS.ReferenceConnector,
            R_FIN_DS.DIActive,
            R_FIN_DS.GFIEnabled,
            R_FIN_DS.DiscreteOutput,
            R_FIN_DS.Group_,
            idr_mp,
            R_FIN_DS.Busbar,
            R_FIN_DS.Panel,
            R_FIN_DS.GroundServiceSupply,        
            R_FIN_DS.SSPCChannels,
            R_FIN_DS.PINAllocation,
            R_FIN_DS.AllocatedPhase,
            R_FIN_DS.FullProvisionStatus,
            R_FIN_DS.PCDStatCon,
            R_FIN_DS.PCDStatPin,
            R_FIN_DS.BackUpValueStatus,
            R_FIN_DS.DefaultValueStatus,
            R_FIN_DS.TypeOfProtection,
            R_FIN_DS.PowerCenterType,
            R_FIN_DS.Classification,
            R_FIN_DS.OperationalBehaviour,
            R_FIN_DS.PowerFactor,
            R_FIN_DS.NominalPower,
            R_FIN_DS.NPP1,
            R_FIN_DS.NPP2,
            R_FIN_DS.NPP3,
            R_FIN_DS.Sheddable,
            R_FIN_DS.Monitored,
            R_FIN_DS.SecuredOpen,
            R_FIN_DS.FlightPriority,
            R_FIN_DS.Priority,
            R_FIN_DS.SysFPriority,
            R_FIN_DS.SysGPriority,
            R_FIN_DS.GroundServMax,  
            R_FIN_DS.TurnAround0015Max,
            R_FIN_DS.TurnAround1530Max,
            R_FIN_DS.TurnAround3045Max,
            R_FIN_DS.TurnAround4560Max,
            R_FIN_DS.TurnAround6075Max,
            R_FIN_DS.TurnAround7590Max,
            R_FIN_DS.TurnAround90105Max,
            R_FIN_DS.TurnAround105120Max,
            R_FIN_DS.TurnAround120135Max,
            R_FIN_DS.TurnAround135150Max,
            R_FIN_DS.TurnAround0015Op,
            R_FIN_DS.TurnAround1530Op,
            R_FIN_DS.TurnAround3045Op,
            R_FIN_DS.TurnAround4560Op,
            R_FIN_DS.TurnAround6075Op,
            R_FIN_DS.TurnAround7590Op,
            R_FIN_DS.TurnAround90105Op,
            R_FIN_DS.TurnAround105120Op,
            R_FIN_DS.TurnAround120135Op,
            R_FIN_DS.TurnAround135150Op,
            R_FIN_DS.PushBackMax,
            R_FIN_DS.StartMax,
            R_FIN_DS.RollMax,
            R_FIN_DS.TakeOffMax,
            R_FIN_DS.ClimbMax,
            R_FIN_DS.CruiseMax,
            R_FIN_DS.DescentMax,
            R_FIN_DS.LandingMax,
            R_FIN_DS.TaxiMax,
            R_FIN_DS.SpareMax,
            R_FIN_DS.EmerConfMax,
            R_FIN_DS.EmerConfOutMax,
            R_FIN_DS.BatConfMax,
            R_FIN_DS.GroundServOp, 
            R_FIN_DS.PushBackOp,
            R_FIN_DS.StartOp,
            R_FIN_DS.RollOp,
            R_FIN_DS.TakeOffOp,
            R_FIN_DS.ClimbOp,
            R_FIN_DS.CruiseOp,
            R_FIN_DS.DescentOp,
            R_FIN_DS.LandingOp,
            R_FIN_DS.TaxiOp,
            R_FIN_DS.SpareOp,
            R_FIN_DS.EmerConfOp,
            R_FIN_DS.EmerConfOutOp,
            R_FIN_DS.BatConfOp,    
            R_FIN_DS.ds_type,
            R_FIN_DS.MG,
            R_FIN_DS.VALM0,
            R_FIN_DS.VALM1,
            R_FIN_DS.VALM2,
            R_FIN_DS.ProtectionIndex
            
    )
    VALUES
    (
            @DSRef,
            @EDDReference,    
            @idr_fin,  
            @EDDMOD,      
            @EDDOption,
            @TypeACDC,
            @Side,
            REPLACE(@Rating,',','.'),
            CASE 
            	WHEN @TypeACDC = 'DC' THEN 'N/A'
            	ELSE @nbrPhase
            END,
            @SSPCAllocatedCardFin,
            @SSPCTypeCard,
            @SubBusBar,
            @ReferenceConnector,
            @DIActive,
            @GFIEnabled,
            @DiscreteOutput,
            CASE WHEN @Sheddable = 'No' THEN 'N/A'
					ELSE @Group_
			END,		     
            @idr_mp,
            @Busbar,
            @PowerCenter,
            CASE 
                WHEN @GroundServiceSupply = 'Normal' THEN 'No' 
                WHEN @GroundServiceSupply = 'Normal & Ground Service' THEN 'Yes' 
            END,        
            @SSPCChannels,
            @PinAllocation,
            @AllocatedPhase,
            @FullProvisionStatus,
            @PCDStatCon,
            @PCDStatPin,
            @BackUpValueStatus,
            @DefaultStatus,
            @TypeOfProtection,
            'SEPDC',
            @ClASsification,
            @OperationalBehaviour,
            REPLACE(@powerfactor,',','.'),
            REPLACE(@NominalPower,',','.'),
            @NPP1,
            @NPP2,
            @NPP3,
            @Sheddable,
            @Monitored,
            @SecuredOpen,
            CASE WHEN @Sheddable = 'No' THEN 'N/A'
					ELSE @FlightPriority
					END,		  
            CASE WHEN @Sheddable = 'No' THEN 'N/A'
					ELSE @Priority
					END,
            CASE WHEN @Sheddable = 'No' THEN 'N/A'
					ELSE @SysFPriority
					END,
          	CASE WHEN @Sheddable = 'No' THEN 'N/A'
					ELSE @SysGPriority
					END,
           

            CONVERT(INTEGER,@GroundServMax),  
            CONVERT(INTEGER,@TurnAround0015Max),
            CONVERT(INTEGER,@TurnAround1530Max),
            CONVERT(INTEGER,@TurnAround3045Max),
            CONVERT(INTEGER,@TurnAround4560Max),
            CONVERT(INTEGER,@TurnAround6075Max),
            CONVERT(INTEGER,@TurnAround7590Max),
            CONVERT(INTEGER,@TurnAround90105Max),
            CONVERT(INTEGER,@TurnAround105120Max),
            CONVERT(INTEGER,@TurnAround120135Max),
            CONVERT(INTEGER,@TurnAround135150Max),
            CONVERT(INTEGER,@TurnAround0015Op),
            CONVERT(INTEGER,@TurnAround1530Op),
            CONVERT(INTEGER,@TurnAround3045Op),
            CONVERT(INTEGER,@TurnAround4560Op),
            CONVERT(INTEGER,@TurnAround6075Op),
            CONVERT(INTEGER,@TurnAround7590Op),
            CONVERT(INTEGER,@TurnAround90105Op),
            CONVERT(INTEGER,@TurnAround105120Op),
            CONVERT(INTEGER,@TurnAround120135Op),
            CONVERT(INTEGER,@TurnAround135150Op),
            CONVERT(INTEGER,@PushBackMax),
            CONVERT(INTEGER,@StartMax),
            CONVERT(INTEGER,@RollMax),
            CONVERT(INTEGER,@TakeOffMax),
            CONVERT(INTEGER,@ClimbMax),
            CONVERT(INTEGER,@CruiseMax),
            CONVERT(INTEGER,@DescentMax),
            CONVERT(INTEGER,@LandingMax),
            CONVERT(INTEGER,@TaxiMax),
            CONVERT(INTEGER,@SpareMax),
            CONVERT(INTEGER,@EmerConfMax),
            CONVERT(INTEGER,@EmerConfOutMax),
            CONVERT(INTEGER,@BatConfMax),
            CONVERT(INTEGER,@GroundServOp), 
            CONVERT(INTEGER,@PushBackOp),
            CONVERT(INTEGER,@StartOp),
            CONVERT(INTEGER,@RollOp),
            CONVERT(INTEGER,@TakeOffOp),
            CONVERT(INTEGER,@ClimbOp),
            CONVERT(INTEGER,@CruiseOp),
            CONVERT(INTEGER,@DescentOp),
            CONVERT(INTEGER,@LandingOp),
            CONVERT(INTEGER,@TaxiOp),
            CONVERT(INTEGER,@SpareOp),
            CONVERT(INTEGER,@EmerConfOp),
            CONVERT(INTEGER,@EmerConfOutOp),
            CONVERT(INTEGER,@BatConfOp),    
            4,
            0,
            'Not Validated',
            'Not Validated',
            'Not Validated',
            'Curve 1'            
    )

    select @id_ds = max(id_ds) from R_FIN_DS where powercentertype = 'SEPDC'

    UPDATE SEPDC_NON_FIN_ASSOCIATED
    SET id_ds = @id_ds
    where fin = @FIN
END
ELSE
BEGIN

    UPDATE R_FIN_DS SET
    	
        EDDReference	=	@EDDReference,    
        idr_fin	=	            @idr_fin,  
        R_FIN_DS.EDDMOD	=	        @EDDMOD,      
         R_FIN_DS.EDDOption	=	            @EDDOption,
        R_FIN_DS.TypeACDC	=	            @TypeACDC,
        R_FIN_DS.Side	=	            @Side,
        R_FIN_DS.Rating	=	            REPLACE(@Rating,',','.'),
        R_FIN_DS.TypePhase	=	   CASE 
            	WHEN @TypeACDC = 'DC' THEN 'N/A'
            	ELSE @nbrPhase
            END,
        R_FIN_DS.SSPCAllocatedCardFin	=	            @SSPCAllocatedCardFin,
        R_FIN_DS.SSPCTypeCard	=	            @SSPCTypeCard,
        R_FIN_DS.SubBusBar	=	            @SubBusBar,
        R_FIN_DS.ReferenceConnector	=	            @ReferenceConnector,
        R_FIN_DS.DIActive	=	            @DIActive,
        R_FIN_DS.GFIEnabled	=	            @GFIEnabled,
        R_FIN_DS.DiscreteOutput	=	            @DiscreteOutput,
        R_FIN_DS.Group_	=	     CASE WHEN @Sheddable = 'No' THEN 'N/A'
					ELSE @Group_
					END,		
					            
        idr_mp	=	            @idr_mp,
        R_FIN_DS.Busbar	=	            @Busbar,
        R_FIN_DS.Panel=	            @PowerCenter,
        R_FIN_DS.GroundServiceSupply     =	            CASE 
        	                WHEN @GroundServiceSupply = 'Normal' THEN 'No' 
                            WHEN @GroundServiceSupply = 'Normal & Ground Service' THEN 'Yes' 
        END,    
            R_FIN_DS.SSPCChannels	=	            @SSPCChannels,
            R_FIN_DS.PINAllocation	=	            @PinAllocation,
            R_FIN_DS.AllocatedPhase	=	            @AllocatedPhase,
            R_FIN_DS.FullProvisionStatus	=	            @FullProvisionStatus,
            R_FIN_DS.PCDStatCon	=	            @PCDStatCon,
            R_FIN_DS.PCDStatPin	=	            @PCDStatPin,
            R_FIN_DS.BackUpValueStatus	=	            @BackUpValueStatus,
            R_FIN_DS.DefaultValueStatus	=	            @DefaultStatus,
            R_FIN_DS.TypeOfProtection	=	            @TypeOfProtection,
            R_FIN_DS.PowerCenterType	=	            'SEPDC',
            R_FIN_DS.Classification	=	            @ClASsification,
            R_FIN_DS.OperationalBehaviour	=	            @OperationalBehaviour,
            R_FIN_DS.PowerFactor	=	            REPLACE(@powerfactor,',','.'),
            R_FIN_DS.NominalPower	=	            REPLACE(@NominalPower,',','.'),
            R_FIN_DS.NPP1	=	            @NPP1,
            R_FIN_DS.NPP2	=	            @NPP2,
            R_FIN_DS.NPP3	=	            @NPP3,
            R_FIN_DS.Sheddable	=	            @Sheddable,
            R_FIN_DS.Monitored	=	            @Monitored,
            R_FIN_DS.SecuredOpen	=	            @SecuredOpen,
            R_FIN_DS.FlightPriority	=	
            		CASE WHEN @Sheddable = 'No' THEN 'N/A'
					ELSE @FlightPriority
					END,		            
            R_FIN_DS.Priority	=	    CASE WHEN @Sheddable = 'No' THEN 'N/A'
					ELSE @Priority
					END,		
							            
            R_FIN_DS.SysFPriority	=	CASE WHEN @Sheddable = 'No' THEN 'N/A'
					ELSE @SysFPriority
					END,		
							           
            R_FIN_DS.SysGPriority	=	CASE WHEN @Sheddable = 'No' THEN 'N/A'
					ELSE @SysGPriority
					END,		
							            
            R_FIN_DS.GroundServMax  	=	            CONVERT(INTEGER,@GroundServMax),  
            R_FIN_DS.TurnAround0015Max	=	            CONVERT(INTEGER,@TurnAround0015Max),
            R_FIN_DS.TurnAround1530Max	=	            CONVERT(INTEGER,@TurnAround1530Max),
            R_FIN_DS.TurnAround3045Max	=	            CONVERT(INTEGER,@TurnAround3045Max),
            R_FIN_DS.TurnAround4560Max	=	            CONVERT(INTEGER,@TurnAround4560Max),
            R_FIN_DS.TurnAround6075Max	=	            CONVERT(INTEGER,@TurnAround6075Max),
            R_FIN_DS.TurnAround7590Max	=	            CONVERT(INTEGER,@TurnAround7590Max),
            R_FIN_DS.TurnAround90105Max	=	            CONVERT(INTEGER,@TurnAround90105Max),
            R_FIN_DS.TurnAround105120Max	=	            CONVERT(INTEGER,@TurnAround105120Max),
            R_FIN_DS.TurnAround120135Max	=	            CONVERT(INTEGER,@TurnAround120135Max),
            R_FIN_DS.TurnAround135150Max	=	            CONVERT(INTEGER,@TurnAround135150Max),
            R_FIN_DS.TurnAround0015Op	=	            CONVERT(INTEGER,@TurnAround0015Op),
            R_FIN_DS.TurnAround1530Op	=	            CONVERT(INTEGER,@TurnAround1530Op),
            R_FIN_DS.TurnAround3045Op	=	            CONVERT(INTEGER,@TurnAround3045Op),
            R_FIN_DS.TurnAround4560Op	=	            CONVERT(INTEGER,@TurnAround4560Op),
            R_FIN_DS.TurnAround6075Op	=	            CONVERT(INTEGER,@TurnAround6075Op),
            R_FIN_DS.TurnAround7590Op	=	            CONVERT(INTEGER,@TurnAround7590Op),
            R_FIN_DS.TurnAround90105Op	=	            CONVERT(INTEGER,@TurnAround90105Op),
            R_FIN_DS.TurnAround105120Op	=	            CONVERT(INTEGER,@TurnAround105120Op),
            R_FIN_DS.TurnAround120135Op	=	            CONVERT(INTEGER,@TurnAround120135Op),
            R_FIN_DS.TurnAround135150Op	=	            CONVERT(INTEGER,@TurnAround135150Op),
            R_FIN_DS.PushBackMax	=	            CONVERT(INTEGER,@PushBackMax),
            R_FIN_DS.StartMax	=	            CONVERT(INTEGER,@StartMax),
            R_FIN_DS.RollMax	=	            CONVERT(INTEGER,@RollMax),
            R_FIN_DS.TakeOffMax	=	            CONVERT(INTEGER,@TakeOffMax),
            R_FIN_DS.ClimbMax	=	            CONVERT(INTEGER,@ClimbMax),
            R_FIN_DS.CruiseMax	=	            CONVERT(INTEGER,@CruiseMax),
            R_FIN_DS.DescentMax	=	            CONVERT(INTEGER,@DescentMax),
            R_FIN_DS.LandingMax	=	            CONVERT(INTEGER,@LandingMax),
            R_FIN_DS.TaxiMax	=	            CONVERT(INTEGER,@TaxiMax),
            R_FIN_DS.SpareMax	=	            CONVERT(INTEGER,@SpareMax),
            R_FIN_DS.EmerConfMax	=	            CONVERT(INTEGER,@EmerConfMax),
            R_FIN_DS.EmerConfOutMax	=	            CONVERT(INTEGER,@EmerConfOutMax),
            R_FIN_DS.BatConfMax	=	            CONVERT(INTEGER,@BatConfMax),
            R_FIN_DS.GroundServOp 	=	            CONVERT(INTEGER,@GroundServOp), 
            R_FIN_DS.PushBackOp	=	            CONVERT(INTEGER,@PushBackOp),
            R_FIN_DS.StartOp	=	            CONVERT(INTEGER,@StartOp),
            R_FIN_DS.RollOp	=	            CONVERT(INTEGER,@RollOp),
            R_FIN_DS.TakeOffOp	=	            CONVERT(INTEGER,@TakeOffOp),
            R_FIN_DS.ClimbOp	=	            CONVERT(INTEGER,@ClimbOp),
            R_FIN_DS.CruiseOp	=	            CONVERT(INTEGER,@CruiseOp),
            R_FIN_DS.DescentOp	=	            CONVERT(INTEGER,@DescentOp),
            R_FIN_DS.LandingOp	=	            CONVERT(INTEGER,@LandingOp),
            R_FIN_DS.TaxiOp	=	            CONVERT(INTEGER,@TaxiOp),
            R_FIN_DS.SpareOp	=	            CONVERT(INTEGER,@SpareOp),
            R_FIN_DS.EmerConfOp	=	            CONVERT(INTEGER,@EmerConfOp),
            R_FIN_DS.EmerConfOutOp	=	            CONVERT(INTEGER,@EmerConfOutOp),
            R_FIN_DS.BatConfOp    	=	            CONVERT(INTEGER,@BatConfOp),    
            R_FIN_DS.ds_type	=	4,
            R_FIN_DS.MG	=	0,
            R_FIN_DS.VALM0 = 'Not Validated',
            R_FIN_DS.VALM1 = 'Not Validated',
            R_FIN_DS.VALM2 = 'Not Validated',
             R_FIN_DS.ProtectionIndex = 'Curve 1'   
        
        WHERE id_ds = @id_ds
    

END




	FETCH NEXT FROM CURSOR_idr_FIN_CI INTO
		@FIN,   
		@mp,
		@EDDMOD,
		@EDDOption,		
		@TypeACDC,
	        @Side,
	        @Rating,
	        @nbrPhase,
	        @SSPCAllocatedCardFin,
	        @SSPCTypeCard,
	        @SubBusBar,
	        @ReferenceConnector,
	        @DIActive,
	        @GFIEnabled,
	        @DiscreteOutput,
	        @Group_,        
	        @Busbar,
	        @PowerCenter,
	        @GroundServiceSupply, 
	        @SSPCChannels,
	        @PinAllocation,
	        @AllocatedPhASe,
	        @FullProvisionStatus,
	        @PCDStatCon,
	        @PCDStatPin,
	        @BackUpValueStatus,
	        @DefaultStatus,
	        @TypeOfProtection,
	        @PowerCenterType,
	        @ClASsification,
	        @OperationalBehaviour,
	        @powerfactor,
	        @NominalPower,
	        @NPP1,
	        @NPP2,
	        @NPP3,
	        @Sheddable,
	        @Monitored,
	        @SecuredOpen,
	        @FlightPriority,
	        @Priority,
	        @SysFPriority,
	        @SysGPriority,
	        @GroundServMax,  
	        @TurnAround0015Max,
	        @TurnAround1530Max,
	        @TurnAround3045Max,
	        @TurnAround4560Max,
	        @TurnAround6075Max,
	        @TurnAround7590Max,
	        @TurnAround90105Max,
	        @TurnAround105120Max,
	        @TurnAround120135Max,
	        @TurnAround135150Max,
	        @TurnAround0015Op,
	        @TurnAround1530Op,
	        @TurnAround3045Op,
	        @TurnAround4560Op,
	        @TurnAround6075Op,
	        @TurnAround7590Op,
	        @TurnAround90105Op,
	        @TurnAround105120Op,
	        @TurnAround120135Op,
	        @TurnAround135150Op,
	        @PushBackMax,
	        @StartMax,
	        @RollMax,
	        @TakeOffMax,
	        @ClimbMax,
	        @CruiseMax,
	        @DescentMax,
	        @LandingMax,
	        @TaxiMax,
	        @SpareMax,
	        @EmerConfMax,
	        @EmerConfOutMax,
	        @BatConfMax,
	        @GroundServOp, 
	        @PushBackOp,
	        @StartOp,
	        @RollOp,
	        @TakeOffOp,
	        @ClimbOp,
	        @CruiseOp,
	        @DescentOp,
	        @LandingOp,
	        @TaxiOp,
	        @SpareOp,
	        @EmerConfOp,
	        @EmerConfOutOp,
	        @BatConfOp
END
CLOSE CURSOR_idr_FIN_CI
DEALLOCATE CURSOR_idr_FIN_CI
        
        
        
        
