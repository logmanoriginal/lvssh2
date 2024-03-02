<?xml version='1.0' encoding='UTF-8'?>
<Project Type="Project" LVVersion="13008000">
	<Property Name="CCSymbols" Type="Str">LVSSH2_NO_EXTENSIONS,False;</Property>
	<Property Name="NI.LV.All.SourceOnly" Type="Bool">true</Property>
	<Property Name="NI.Project.Description" Type="Str"></Property>
	<Item Name="My Computer" Type="My Computer">
		<Property Name="server.app.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="server.control.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="server.tcp.enabled" Type="Bool">false</Property>
		<Property Name="server.tcp.port" Type="Int">0</Property>
		<Property Name="server.tcp.serviceName" Type="Str">My Computer/VI Server</Property>
		<Property Name="server.tcp.serviceName.default" Type="Str">My Computer/VI Server</Property>
		<Property Name="server.vi.callsEnabled" Type="Bool">true</Property>
		<Property Name="server.vi.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="specify.custom.address" Type="Bool">false</Property>
		<Item Name="examples" Type="Folder">
			<Item Name="banner.vi" Type="VI" URL="../examples/banner.vi"/>
			<Item Name="debug_trace.vi" Type="VI" URL="../examples/debug_trace.vi"/>
			<Item Name="direct_tcpip.vi" Type="VI" URL="../examples/direct_tcpip.vi"/>
			<Item Name="knownhosts.vi" Type="VI" URL="../examples/knownhosts.vi"/>
			<Item Name="session_compression.vi" Type="VI" URL="../examples/session_compression.vi"/>
			<Item Name="session_error.vi" Type="VI" URL="../examples/session_error.vi"/>
			<Item Name="session_methods.vi" Type="VI" URL="../examples/session_methods.vi"/>
			<Item Name="session_timeout.vi" Type="VI" URL="../examples/session_timeout.vi"/>
			<Item Name="sftp.vi" Type="VI" URL="../examples/sftp.vi"/>
			<Item Name="sftp_append.vi" Type="VI" URL="../examples/sftp_append.vi"/>
			<Item Name="sftp_fstat.vi" Type="VI" URL="../examples/sftp_fstat.vi"/>
			<Item Name="sftp_mkdir.vi" Type="VI" URL="../examples/sftp_mkdir.vi"/>
			<Item Name="sftp_stat.vi" Type="VI" URL="../examples/sftp_stat.vi"/>
			<Item Name="sftp_statvfs.vi" Type="VI" URL="../examples/sftp_statvfs.vi"/>
			<Item Name="sftp_write.vi" Type="VI" URL="../examples/sftp_write.vi"/>
			<Item Name="sftpdir.vi" Type="VI" URL="../examples/sftpdir.vi"/>
			<Item Name="ssh2.vi" Type="VI" URL="../examples/ssh2.vi"/>
			<Item Name="ssh2_agent.vi" Type="VI" URL="../examples/ssh2_agent.vi"/>
			<Item Name="ssh2_echo.vi" Type="VI" URL="../examples/ssh2_echo.vi"/>
			<Item Name="ssh2_exec.vi" Type="VI" URL="../examples/ssh2_exec.vi"/>
			<Item Name="tcpip_forward.vi" Type="VI" URL="../examples/tcpip_forward.vi"/>
		</Item>
		<Item Name="libssh2.lvlib" Type="Library" URL="../libssh2/libssh2.lvlib"/>
		<Item Name="libssh2_tests.lvlib" Type="Library" URL="../tests/libssh2_tests/libssh2_tests.lvlib"/>
		<Item Name="Dependencies" Type="Dependencies">
			<Item Name="vi.lib" Type="Folder">
				<Item Name="96D64E02C3F47849182DC8639B93F2ADArray Size(s)__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/96D64E02C3F47849182DC8639B93F2ADArray Size(s)__ogtk.vi"/>
				<Item Name="96D64E02C3F47849182DC8639B93F2ADArray to Array of VData__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/96D64E02C3F47849182DC8639B93F2ADArray to Array of VData__ogtk.vi"/>
				<Item Name="96D64E02C3F47849182DC8639B93F2ADBuild Error Cluster__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/96D64E02C3F47849182DC8639B93F2ADBuild Error Cluster__ogtk.vi"/>
				<Item Name="96D64E02C3F47849182DC8639B93F2ADBuild Path - File Names Array__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/96D64E02C3F47849182DC8639B93F2ADBuild Path - File Names Array__ogtk.vi"/>
				<Item Name="96D64E02C3F47849182DC8639B93F2ADCluster to Array of VData__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/96D64E02C3F47849182DC8639B93F2ADCluster to Array of VData__ogtk.vi"/>
				<Item Name="96D64E02C3F47849182DC8639B93F2ADDelete Elements from 1D Array (Path)__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/96D64E02C3F47849182DC8639B93F2ADDelete Elements from 1D Array (Path)__ogtk.vi"/>
				<Item Name="96D64E02C3F47849182DC8639B93F2ADDelete Elements from 1D Array (String)__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/96D64E02C3F47849182DC8639B93F2ADDelete Elements from 1D Array (String)__ogtk.vi"/>
				<Item Name="96D64E02C3F47849182DC8639B93F2ADEmpty 1D Array (String)__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/96D64E02C3F47849182DC8639B93F2ADEmpty 1D Array (String)__ogtk.vi"/>
				<Item Name="96D64E02C3F47849182DC8639B93F2ADFile Exists - Array__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/96D64E02C3F47849182DC8639B93F2ADFile Exists - Array__ogtk.vi"/>
				<Item Name="96D64E02C3F47849182DC8639B93F2ADFile Exists - Scalar__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/96D64E02C3F47849182DC8639B93F2ADFile Exists - Scalar__ogtk.vi"/>
				<Item Name="96D64E02C3F47849182DC8639B93F2ADFilter 1D Array (Path)__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/96D64E02C3F47849182DC8639B93F2ADFilter 1D Array (Path)__ogtk.vi"/>
				<Item Name="96D64E02C3F47849182DC8639B93F2ADFilter 1D Array (String)__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/96D64E02C3F47849182DC8639B93F2ADFilter 1D Array (String)__ogtk.vi"/>
				<Item Name="96D64E02C3F47849182DC8639B93F2ADFormat Variant Into String__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/96D64E02C3F47849182DC8639B93F2ADFormat Variant Into String__ogtk.vi"/>
				<Item Name="96D64E02C3F47849182DC8639B93F2ADGet Array Element TDEnum__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/96D64E02C3F47849182DC8639B93F2ADGet Array Element TDEnum__ogtk.vi"/>
				<Item Name="96D64E02C3F47849182DC8639B93F2ADGet Data Name from TD__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/96D64E02C3F47849182DC8639B93F2ADGet Data Name from TD__ogtk.vi"/>
				<Item Name="96D64E02C3F47849182DC8639B93F2ADGet Data Name__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/96D64E02C3F47849182DC8639B93F2ADGet Data Name__ogtk.vi"/>
				<Item Name="96D64E02C3F47849182DC8639B93F2ADGet Element TD from Array TD__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/96D64E02C3F47849182DC8639B93F2ADGet Element TD from Array TD__ogtk.vi"/>
				<Item Name="96D64E02C3F47849182DC8639B93F2ADGet Header from TD__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/96D64E02C3F47849182DC8639B93F2ADGet Header from TD__ogtk.vi"/>
				<Item Name="96D64E02C3F47849182DC8639B93F2ADGet Last PString__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/96D64E02C3F47849182DC8639B93F2ADGet Last PString__ogtk.vi"/>
				<Item Name="96D64E02C3F47849182DC8639B93F2ADGet Local UTC Offset.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/96D64E02C3F47849182DC8639B93F2ADGet Local UTC Offset.vi"/>
				<Item Name="96D64E02C3F47849182DC8639B93F2ADGet Physical Units from TD__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/96D64E02C3F47849182DC8639B93F2ADGet Physical Units from TD__ogtk.vi"/>
				<Item Name="96D64E02C3F47849182DC8639B93F2ADGet Physical Units__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/96D64E02C3F47849182DC8639B93F2ADGet Physical Units__ogtk.vi"/>
				<Item Name="96D64E02C3F47849182DC8639B93F2ADGet PString__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/96D64E02C3F47849182DC8639B93F2ADGet PString__ogtk.vi"/>
				<Item Name="96D64E02C3F47849182DC8639B93F2ADGet Refnum Type Enum from Data__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/96D64E02C3F47849182DC8639B93F2ADGet Refnum Type Enum from Data__ogtk.vi"/>
				<Item Name="96D64E02C3F47849182DC8639B93F2ADGet Refnum Type Enum from TD__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/96D64E02C3F47849182DC8639B93F2ADGet Refnum Type Enum from TD__ogtk.vi"/>
				<Item Name="96D64E02C3F47849182DC8639B93F2ADGet Strings from Enum TD__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/96D64E02C3F47849182DC8639B93F2ADGet Strings from Enum TD__ogtk.vi"/>
				<Item Name="96D64E02C3F47849182DC8639B93F2ADGet Strings from Enum__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/96D64E02C3F47849182DC8639B93F2ADGet Strings from Enum__ogtk.vi"/>
				<Item Name="96D64E02C3F47849182DC8639B93F2ADGet TDEnum from Data__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/96D64E02C3F47849182DC8639B93F2ADGet TDEnum from Data__ogtk.vi"/>
				<Item Name="96D64E02C3F47849182DC8639B93F2ADGet TDEnum from TD__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/96D64E02C3F47849182DC8639B93F2ADGet TDEnum from TD__ogtk.vi"/>
				<Item Name="96D64E02C3F47849182DC8639B93F2ADGet Variant Attributes__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/96D64E02C3F47849182DC8639B93F2ADGet Variant Attributes__ogtk.vi"/>
				<Item Name="96D64E02C3F47849182DC8639B93F2ADGet Waveform Type Enum from Data__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/96D64E02C3F47849182DC8639B93F2ADGet Waveform Type Enum from Data__ogtk.vi"/>
				<Item Name="96D64E02C3F47849182DC8639B93F2ADGet Waveform Type Enum from TD__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/96D64E02C3F47849182DC8639B93F2ADGet Waveform Type Enum from TD__ogtk.vi"/>
				<Item Name="96D64E02C3F47849182DC8639B93F2ADList Directory Recursive__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/96D64E02C3F47849182DC8639B93F2ADList Directory Recursive__ogtk.vi"/>
				<Item Name="96D64E02C3F47849182DC8639B93F2ADList Directory__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/96D64E02C3F47849182DC8639B93F2ADList Directory__ogtk.vi"/>
				<Item Name="96D64E02C3F47849182DC8639B93F2ADParse String with TDs__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/96D64E02C3F47849182DC8639B93F2ADParse String with TDs__ogtk.vi"/>
				<Item Name="96D64E02C3F47849182DC8639B93F2ADRemove Duplicates from 1D Array (I32)__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/96D64E02C3F47849182DC8639B93F2ADRemove Duplicates from 1D Array (I32)__ogtk.vi"/>
				<Item Name="96D64E02C3F47849182DC8639B93F2ADRemove Duplicates from 1D Array (Path)__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/96D64E02C3F47849182DC8639B93F2ADRemove Duplicates from 1D Array (Path)__ogtk.vi"/>
				<Item Name="96D64E02C3F47849182DC8639B93F2ADRemove Duplicates from 1D Array (String)__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/96D64E02C3F47849182DC8639B93F2ADRemove Duplicates from 1D Array (String)__ogtk.vi"/>
				<Item Name="96D64E02C3F47849182DC8639B93F2ADReorder 1D Array2 (Path)__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/96D64E02C3F47849182DC8639B93F2ADReorder 1D Array2 (Path)__ogtk.vi"/>
				<Item Name="96D64E02C3F47849182DC8639B93F2ADReorder 1D Array2 (String)__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/96D64E02C3F47849182DC8639B93F2ADReorder 1D Array2 (String)__ogtk.vi"/>
				<Item Name="96D64E02C3F47849182DC8639B93F2ADReshape Array to 1D VArray__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/96D64E02C3F47849182DC8639B93F2ADReshape Array to 1D VArray__ogtk.vi"/>
				<Item Name="96D64E02C3F47849182DC8639B93F2ADResolve Timestamp Format__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/96D64E02C3F47849182DC8639B93F2ADResolve Timestamp Format__ogtk.vi"/>
				<Item Name="96D64E02C3F47849182DC8639B93F2ADSearch 1D Array (Path)__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/96D64E02C3F47849182DC8639B93F2ADSearch 1D Array (Path)__ogtk.vi"/>
				<Item Name="96D64E02C3F47849182DC8639B93F2ADSearch 1D Array (String)__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/96D64E02C3F47849182DC8639B93F2ADSearch 1D Array (String)__ogtk.vi"/>
				<Item Name="96D64E02C3F47849182DC8639B93F2ADSet Data Name__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/96D64E02C3F47849182DC8639B93F2ADSet Data Name__ogtk.vi"/>
				<Item Name="96D64E02C3F47849182DC8639B93F2ADSort 1D Array (I32)__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/96D64E02C3F47849182DC8639B93F2ADSort 1D Array (I32)__ogtk.vi"/>
				<Item Name="96D64E02C3F47849182DC8639B93F2ADSplit Cluster TD__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/96D64E02C3F47849182DC8639B93F2ADSplit Cluster TD__ogtk.vi"/>
				<Item Name="96D64E02C3F47849182DC8639B93F2ADStrip Path - Traditional__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/96D64E02C3F47849182DC8639B93F2ADStrip Path - Traditional__ogtk.vi"/>
				<Item Name="96D64E02C3F47849182DC8639B93F2ADStrip Path Extension - String__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/96D64E02C3F47849182DC8639B93F2ADStrip Path Extension - String__ogtk.vi"/>
				<Item Name="96D64E02C3F47849182DC8639B93F2ADStrip Units__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/96D64E02C3F47849182DC8639B93F2ADStrip Units__ogtk.vi"/>
				<Item Name="96D64E02C3F47849182DC8639B93F2ADTimestamp to ISO8601 UTC DateTime.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/96D64E02C3F47849182DC8639B93F2ADTimestamp to ISO8601 UTC DateTime.vi"/>
				<Item Name="96D64E02C3F47849182DC8639B93F2ADTrim Whitespace (String)__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/96D64E02C3F47849182DC8639B93F2ADTrim Whitespace (String)__ogtk.vi"/>
				<Item Name="96D64E02C3F47849182DC8639B93F2ADUnwrap VVariant__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/96D64E02C3F47849182DC8639B93F2ADUnwrap VVariant__ogtk.vi"/>
				<Item Name="96D64E02C3F47849182DC8639B93F2ADValid Path - Traditional__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/96D64E02C3F47849182DC8639B93F2ADValid Path - Traditional__ogtk.vi"/>
				<Item Name="96D64E02C3F47849182DC8639B93F2ADVariant to Header Info__ogtk.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/_Caraya_internal_deps/96D64E02C3F47849182DC8639B93F2ADVariant to Header Info__ogtk.vi"/>
				<Item Name="Add State(s) to Queue__jki_lib_state_machine.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/State Machine/_JKI_lib_State_Machine.llb/Add State(s) to Queue__jki_lib_state_machine.vi"/>
				<Item Name="Application Directory.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Application Directory.vi"/>
				<Item Name="BuildHelpPath.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/BuildHelpPath.vi"/>
				<Item Name="Caraya Interactive Menu.rtm" Type="Document" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/Caraya/menu/Caraya Interactive Menu.rtm"/>
				<Item Name="Caraya.lvlib" Type="Library" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/Caraya/Caraya.lvlib"/>
				<Item Name="Check if File or Folder Exists.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Check if File or Folder Exists.vi"/>
				<Item Name="Check Special Tags.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Check Special Tags.vi"/>
				<Item Name="Clear Errors.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Clear Errors.vi"/>
				<Item Name="Compare Two Paths.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Compare Two Paths.vi"/>
				<Item Name="Convert property node font to graphics font.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Convert property node font to graphics font.vi"/>
				<Item Name="Details Display Dialog.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Details Display Dialog.vi"/>
				<Item Name="Dflt Data Dir.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Dflt Data Dir.vi"/>
				<Item Name="DialogType.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/DialogType.ctl"/>
				<Item Name="DialogTypeEnum.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/DialogTypeEnum.ctl"/>
				<Item Name="Error Cluster From Error Code.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Error Cluster From Error Code.vi"/>
				<Item Name="Error Code Database.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Error Code Database.vi"/>
				<Item Name="ErrWarn.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/ErrWarn.ctl"/>
				<Item Name="Escape Characters for HTTP.vi" Type="VI" URL="/&lt;vilib&gt;/printing/PathToURL.llb/Escape Characters for HTTP.vi"/>
				<Item Name="eventvkey.ctl" Type="VI" URL="/&lt;vilib&gt;/event_ctls.llb/eventvkey.ctl"/>
				<Item Name="ex_CorrectErrorChain.vi" Type="VI" URL="/&lt;vilib&gt;/express/express shared/ex_CorrectErrorChain.vi"/>
				<Item Name="Find Tag.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Find Tag.vi"/>
				<Item Name="Format Message String.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Format Message String.vi"/>
				<Item Name="General Error Handler CORE.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/General Error Handler CORE.vi"/>
				<Item Name="General Error Handler.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/General Error Handler.vi"/>
				<Item Name="Get File Extension.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Get File Extension.vi"/>
				<Item Name="Get File System Separator.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/sysinfo.llb/Get File System Separator.vi"/>
				<Item Name="Get LV Class Name.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/LVClass/Get LV Class Name.vi"/>
				<Item Name="Get LV Class Path.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/LVClass/Get LV Class Path.vi"/>
				<Item Name="Get String Text Bounds.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Get String Text Bounds.vi"/>
				<Item Name="Get System Directory.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/sysdir.llb/Get System Directory.vi"/>
				<Item Name="Get Text Rect.vi" Type="VI" URL="/&lt;vilib&gt;/picture/picture.llb/Get Text Rect.vi"/>
				<Item Name="Get VI Library File Info.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Get VI Library File Info.vi"/>
				<Item Name="GetHelpDir.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/GetHelpDir.vi"/>
				<Item Name="GetRTHostConnectedProp.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/GetRTHostConnectedProp.vi"/>
				<Item Name="Has LLB Extension.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Has LLB Extension.vi"/>
				<Item Name="imagedata.ctl" Type="VI" URL="/&lt;vilib&gt;/picture/picture.llb/imagedata.ctl"/>
				<Item Name="Librarian File Info In.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Librarian File Info In.ctl"/>
				<Item Name="Librarian File Info Out.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Librarian File Info Out.ctl"/>
				<Item Name="Librarian File List.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Librarian File List.ctl"/>
				<Item Name="Librarian.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Librarian.vi"/>
				<Item Name="List Directory and LLBs.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/List Directory and LLBs.vi"/>
				<Item Name="Longest Line Length in Pixels.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Longest Line Length in Pixels.vi"/>
				<Item Name="LVBoundsTypeDef.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/miscctls.llb/LVBoundsTypeDef.ctl"/>
				<Item Name="NI_FileType.lvlib" Type="Library" URL="/&lt;vilib&gt;/Utility/lvfile.llb/NI_FileType.lvlib"/>
				<Item Name="NI_PackedLibraryUtility.lvlib" Type="Library" URL="/&lt;vilib&gt;/Utility/LVLibp/NI_PackedLibraryUtility.lvlib"/>
				<Item Name="Not Found Dialog.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Not Found Dialog.vi"/>
				<Item Name="Open URL in Default Browser (path).vi" Type="VI" URL="/&lt;vilib&gt;/Platform/browser.llb/Open URL in Default Browser (path).vi"/>
				<Item Name="Open URL in Default Browser (string).vi" Type="VI" URL="/&lt;vilib&gt;/Platform/browser.llb/Open URL in Default Browser (string).vi"/>
				<Item Name="Open URL in Default Browser core.vi" Type="VI" URL="/&lt;vilib&gt;/Platform/browser.llb/Open URL in Default Browser core.vi"/>
				<Item Name="Open URL in Default Browser.vi" Type="VI" URL="/&lt;vilib&gt;/Platform/browser.llb/Open URL in Default Browser.vi"/>
				<Item Name="Parse State Queue__jki_lib_state_machine.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/State Machine/_JKI_lib_State_Machine.llb/Parse State Queue__jki_lib_state_machine.vi"/>
				<Item Name="Path to URL.vi" Type="VI" URL="/&lt;vilib&gt;/printing/PathToURL.llb/Path to URL.vi"/>
				<Item Name="Recursive File List.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Recursive File List.vi"/>
				<Item Name="Search and Replace Pattern.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Search and Replace Pattern.vi"/>
				<Item Name="Set Bold Text.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Set Bold Text.vi"/>
				<Item Name="Set Busy.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/cursorutil.llb/Set Busy.vi"/>
				<Item Name="Set Cursor (Cursor ID).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/cursorutil.llb/Set Cursor (Cursor ID).vi"/>
				<Item Name="Set Cursor (Icon Pict).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/cursorutil.llb/Set Cursor (Icon Pict).vi"/>
				<Item Name="Set Cursor.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/cursorutil.llb/Set Cursor.vi"/>
				<Item Name="Set String Value.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Set String Value.vi"/>
				<Item Name="Space Constant.vi" Type="VI" URL="/&lt;vilib&gt;/dlg_ctls.llb/Space Constant.vi"/>
				<Item Name="subFile Dialog.vi" Type="VI" URL="/&lt;vilib&gt;/express/express input/FileDialogBlock.llb/subFile Dialog.vi"/>
				<Item Name="System Directory Type.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/sysdir.llb/System Directory Type.ctl"/>
				<Item Name="TagReturnType.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/TagReturnType.ctl"/>
				<Item Name="TCP Get Raw Net Object.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/tcp.llb/TCP Get Raw Net Object.vi"/>
				<Item Name="TD_Get MDT Information.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/GetType.llb/TD_Get MDT Information.vi"/>
				<Item Name="TD_MDTFlavor.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/GetType.llb/TD_MDTFlavor.ctl"/>
				<Item Name="Three Button Dialog CORE.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Three Button Dialog CORE.vi"/>
				<Item Name="Three Button Dialog.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Three Button Dialog.vi"/>
				<Item Name="TRef Traverse for References.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/traverseref.llb/TRef Traverse for References.vi"/>
				<Item Name="TRef Traverse.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/traverseref.llb/TRef Traverse.vi"/>
				<Item Name="TRef TravTarget.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/traverseref.llb/TRef TravTarget.ctl"/>
				<Item Name="Trim Whitespace.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Trim Whitespace.vi"/>
				<Item Name="Type Descriptor I16 Array.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/GetType.llb/Type Descriptor I16 Array.ctl"/>
				<Item Name="Type Descriptor I16.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/GetType.llb/Type Descriptor I16.ctl"/>
				<Item Name="Unset Busy.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/cursorutil.llb/Unset Busy.vi"/>
				<Item Name="VariantType.lvlib" Type="Library" URL="/&lt;vilib&gt;/Utility/VariantDataType/VariantType.lvlib"/>
				<Item Name="VI Scripting - Traverse.lvlib" Type="Library" URL="/&lt;vilib&gt;/Utility/traverseref.llb/VI Scripting - Traverse.lvlib"/>
				<Item Name="whitespace.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/whitespace.ctl"/>
			</Item>
			<Item Name="libssh2.dll" Type="Document" URL="../libssh2/libssh2.dll"/>
			<Item Name="lvssh2_extensions.dll" Type="Document" URL="../libssh2/lvssh2_extensions.dll"/>
			<Item Name="TRef FinderCallback.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/traverseref.llb/TRef FinderCallback.vi"/>
		</Item>
		<Item Name="Build Specifications" Type="Build"/>
	</Item>
</Project>
