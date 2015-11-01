function ivInit
	global state gh
	waveUserDefaults('axisAutoScale', 2);
	evalin('base', 'global state gh	');
	
	gh.imageViewer = guihandles(imageViewer);
	gh.ivAnalysisSettings = guihandles(ivAnalysisSettings);
	gh.ivChannels = guihandles(ivChannels);
	gh.ivKeyboardShortCuts = guihandles(ivKeyboardShortCuts);
	openini('imageViewer.ini');

	state.imageViewer.parametersToLoad= { ...
			'offsetChannel1', 'state.acq.pmtOffsetChannel1', ...
			'offsetChannel2', 'state.acq.pmtOffsetChannel2', ...
			'offsetChannel3', 'state.acq.pmtOffsetChannel3', ...
			'channelOn1', 'state.acq.savingChannel1', ...
			'channelOn2', 'state.acq.savingChannel2', ...
			'channelOn3', 'state.acq.savingChannel3', ...
			'micronsPerSlice', 'state.acq.zStepSize', ...
			'nPixelsY', 'state.acq.linesPerFrame', ...
			'nPixelsX', 'state.acq.pixelsPerLine', ...
			'nSlices', 'state.acq.numberOfZSlices', ...
			'zoom', 'state.acq.zoomFactor', ...
			'binFactor', 'state.acq.binFactor', ...
			'dualScanMode', 'state.acq.dualLaserMode'...
			'epoch', 'state.epoch',...
			'triggerTime', 'state.internal.triggerTimeInSeconds' ...
		};
			
	state.imageViewer.fieldsForExcel = { ...
			'fileName', ...
			'zoom',  ...
			'triggerTime', ...
			'displayedSlice', ...
			'channelOn1', ...
			'channelOn2', ...
			'channelOn3', ...
			'channelOn4', ...
			'offsetChannel1', ...
			'offsetChannel2', ...
			'offsetChannel3', ...
			'offsetChannel4', ...
		};

	state.imageViewer.fieldsForExcelLabels = { ...
			'file', ...
			'zoom',  ...
			'time', ...
			'slice', ...
			'chan 1', ...
			'chan 2', ...
			'chan 3', ...
			'chan 4', ...
			'offset 1', ...
			'offset 2', ...
			'offset 3', ...
			'offset 4', ...
		};
	
	state.imageViewer.analysisFields = { ...
		'anaChannels', ...
		'anaMaxChannels', ...
		'viewChannels', ...
		'maxViewChannels', ...
		'analysisMode', ...
		'projectionMode', ...
		'analyzeBoxes', ...
		'analyzeLines', ...
		'autoSetBoxPeak', ...
		'autoLocalTrack', ...
		'autoSetAnalysisBox', ...
		'autoSetAnalysisSlice', ...
		'compositeLockRed', ...
		'compositeLockGreen', ...
		'compositeLockBlue', ...
		'compositeChannel1', ...
		'compositeChannel2', ...
		'compositeChannel3', ...
		'compositeChannel4', ...
		'compositeChannel11', ...
		'compositeChannel12', ...
		'compositeChannel13', ...
		'compositeChannel14', ...
		'compositeOn', ...
		'compositeProjection', ...
		'maxOnly', ...
		'autoMedianFilter', ...
		'autoProject', ...
		'trackMode', ...
		'lineBlur', ...
		'displayedSliceSmear', ...
		'lowLUT1', ...
		'highLUT1', ...
		'lowLUT2', ...
		'highLUT2', ...
		'lowLUT3', ...
		'highLUT3', ...
		'lowLUT4', ...
		'highLUT4', ...
		'lowLUT11', ...
		'highLUT11', ...
		'lowLUT12', ...
		'highLUT12', ...
		'lowLUT13', ...
		'highLUT13', ...
		'lowLUT14', ...
		'highLUT14', ...
		'morphMenuValue', ...
		'morphChannel', ...
		'morphChannelIndex', ...
		'morphChannelIsProj', ...
		'selectionMenuValue', ...
		'selectionChannel', ...
		'selectionChannelIndex', ...
		'selectionChannelIsProj', ...
		'offsetMode', ...
		'smoothingWidth', ...
		'widthFraction', ...
		'numTopPixels', ...
		'boxFraction', ...
		'autoSetSpineStart', ...
		'spineStartThresh' ...
	};
	
	state.imageViewer.currentDataFields = {...
		'tsShift', ...
		'tsFileNames', ...
		'tsFilePaths', ...
		'tsDendriteLength', ...
		'objStructs' ...
	};

	waveo('objectMinorProfile', []);
	waveo('objectMinorMaskX', []);
	waveo('objectMinorMaskY', []);
	waveo('objectMajorProfile', []);
	waveo('objectMajorMaskX', []);
	waveo('objectMajorMaskY', []);
	waveo('objectTimeStampWave',  []);
	waveo('objectWidthWave',  []);
	waveo('objectLengthWave',  []);
	waveo('objectMassWave',  []);
	
	state.imageViewer.dataChannels=zeros(1,20);
	state.imageViewer.anaChannels=ones(1,20);
	state.imageViewer.viewChannels=ones(1,20);
	state.imageViewer.anaMaxChannels=ones(1,20);
	state.imageViewer.maxViewChannels=ones(1,20);
	state.imageViewer.objStructs=[];
	ivSetValidAnaChannels;
	
	ivMakeFigureWindows;
	open('profileFigure.fig')
	reactivateWavePlot	
	open('lengthWidthTimeFigure.fig')
	reactivateWavePlot
	open('massTimeFigure.fig')
	reactivateWavePlot	