<?xml version='1.0' encoding='UTF-8'?>
<Project Type="Project" LVVersion="17008000">
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
			<Item Name="agent_sign.vi" Type="VI" URL="../examples/agent_sign.vi"/>
			<Item Name="banner.vi" Type="VI" URL="../examples/banner.vi"/>
			<Item Name="channel_agent_forward.vi" Type="VI" URL="../examples/channel_agent_forward.vi"/>
			<Item Name="channel_handle_extended_data.vi" Type="VI" URL="../examples/channel_handle_extended_data.vi"/>
			<Item Name="channel_request_pty.vi" Type="VI" URL="../examples/channel_request_pty.vi"/>
			<Item Name="channel_setenv.vi" Type="VI" URL="../examples/channel_setenv.vi"/>
			<Item Name="channel_signal.vi" Type="VI" URL="../examples/channel_signal.vi"/>
			<Item Name="debug_trace.vi" Type="VI" URL="../examples/debug_trace.vi"/>
			<Item Name="direct_tcpip.vi" Type="VI" URL="../examples/direct_tcpip.vi"/>
			<Item Name="keepalive.vi" Type="VI" URL="../examples/keepalive.vi"/>
			<Item Name="knownhosts.vi" Type="VI" URL="../examples/knownhosts.vi"/>
			<Item Name="knownhosts_add.vi" Type="VI" URL="../examples/knownhosts_add.vi"/>
			<Item Name="knownhosts_delete.vi" Type="VI" URL="../examples/knownhosts_delete.vi"/>
			<Item Name="knownhosts_readline.vi" Type="VI" URL="../examples/knownhosts_readline.vi"/>
			<Item Name="knownhosts_writeline.vi" Type="VI" URL="../examples/knownhosts_writeline.vi"/>
			<Item Name="libssh2_info.vi" Type="VI" URL="../examples/libssh2_info.vi"/>
			<Item Name="scp_recv.vi" Type="VI" URL="../examples/scp_recv.vi"/>
			<Item Name="scp_send.vi" Type="VI" URL="../examples/scp_send.vi"/>
			<Item Name="session_callback.vi" Type="VI" URL="../examples/session_callback.vi"/>
			<Item Name="session_callback_receive.vi" Type="VI" URL="../examples/session_callback_receive.vi"/>
			<Item Name="session_callback_send.vi" Type="VI" URL="../examples/session_callback_send.vi"/>
			<Item Name="session_compression.vi" Type="VI" URL="../examples/session_compression.vi"/>
			<Item Name="session_error.vi" Type="VI" URL="../examples/session_error.vi"/>
			<Item Name="session_methods.vi" Type="VI" URL="../examples/session_methods.vi"/>
			<Item Name="session_timeout.vi" Type="VI" URL="../examples/session_timeout.vi"/>
			<Item Name="sftp.vi" Type="VI" URL="../examples/sftp.vi"/>
			<Item Name="sftp_append.vi" Type="VI" URL="../examples/sftp_append.vi"/>
			<Item Name="sftp_error.vi" Type="VI" URL="../examples/sftp_error.vi"/>
			<Item Name="sftp_fstat.vi" Type="VI" URL="../examples/sftp_fstat.vi"/>
			<Item Name="sftp_mkdir.vi" Type="VI" URL="../examples/sftp_mkdir.vi"/>
			<Item Name="sftp_rename.vi" Type="VI" URL="../examples/sftp_rename.vi"/>
			<Item Name="sftp_rmdir.vi" Type="VI" URL="../examples/sftp_rmdir.vi"/>
			<Item Name="sftp_stat.vi" Type="VI" URL="../examples/sftp_stat.vi"/>
			<Item Name="sftp_statvfs.vi" Type="VI" URL="../examples/sftp_statvfs.vi"/>
			<Item Name="sftp_symlink.vi" Type="VI" URL="../examples/sftp_symlink.vi"/>
			<Item Name="sftp_unlink.vi" Type="VI" URL="../examples/sftp_unlink.vi"/>
			<Item Name="sftp_write.vi" Type="VI" URL="../examples/sftp_write.vi"/>
			<Item Name="sftpdir.vi" Type="VI" URL="../examples/sftpdir.vi"/>
			<Item Name="ssh2.vi" Type="VI" URL="../examples/ssh2.vi"/>
			<Item Name="ssh2_agent.vi" Type="VI" URL="../examples/ssh2_agent.vi"/>
			<Item Name="ssh2_echo.vi" Type="VI" URL="../examples/ssh2_echo.vi"/>
			<Item Name="ssh2_exec.vi" Type="VI" URL="../examples/ssh2_exec.vi"/>
			<Item Name="tcpip_forward.vi" Type="VI" URL="../examples/tcpip_forward.vi"/>
			<Item Name="userauth_authenticated.vi" Type="VI" URL="../examples/userauth_authenticated.vi"/>
			<Item Name="userauth_hostbased_fromfile.vi" Type="VI" URL="../examples/userauth_hostbased_fromfile.vi"/>
			<Item Name="userauth_keyboard_interactive.vi" Type="VI" URL="../examples/userauth_keyboard_interactive.vi"/>
			<Item Name="userauth_keyboard_interactive_response.vi" Type="VI" URL="../examples/userauth_keyboard_interactive_response.vi"/>
			<Item Name="userauth_list.vi" Type="VI" URL="../examples/userauth_list.vi"/>
			<Item Name="userauth_publickey.vi" Type="VI" URL="../examples/userauth_publickey.vi"/>
			<Item Name="userauth_publickey_fromfile.vi" Type="VI" URL="../examples/userauth_publickey_fromfile.vi"/>
			<Item Name="userauth_publickey_frommemory.vi" Type="VI" URL="../examples/userauth_publickey_frommemory.vi"/>
			<Item Name="userauth_publickey_sign.vi" Type="VI" URL="../examples/userauth_publickey_sign.vi"/>
		</Item>
		<Item Name="tests" Type="Folder">
			<Item Name="bug_reports.lvlib" Type="Library" URL="../tests/bug_reports/bug_reports.lvlib"/>
			<Item Name="example_tests.lvlib" Type="Library" URL="../tests/example_tests/example_tests.lvlib"/>
			<Item Name="integration_tests.lvlib" Type="Library" URL="../tests/integration_tests/integration_tests.lvlib"/>
			<Item Name="support.lvlib" Type="Library" URL="../tests/support/support.lvlib"/>
			<Item Name="unit_tests.lvlib" Type="Library" URL="../tests/unit_tests/unit_tests.lvlib"/>
		</Item>
		<Item Name="libssh2.lvlib" Type="Library" URL="../libssh2/libssh2.lvlib"/>
		<Item Name="Dependencies" Type="Dependencies">
			<Item Name="vi.lib" Type="Folder">
				<Item Name="__JSONtext__Variant to Flattened String (special).vi" Type="VI" URL="/&lt;vilib&gt;/PNR/JSONtext Object Serialization/Vendor/__JSONtext__Variant to Flattened String (special).vi"/>
				<Item Name="Acquire Semaphore.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/semaphor.llb/Acquire Semaphore.vi"/>
				<Item Name="AddNamedSemaphorePrefix.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/semaphor.llb/AddNamedSemaphorePrefix.vi"/>
				<Item Name="Application Directory.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Application Directory.vi"/>
				<Item Name="Base64 Support.lvlib" Type="Library" URL="/&lt;vilib&gt;/JDP Science/JDP Science Common Utilities/Base64/Base64 Support.lvlib"/>
				<Item Name="BuildHelpPath.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/BuildHelpPath.vi"/>
				<Item Name="Check Special Tags.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Check Special Tags.vi"/>
				<Item Name="Clear Errors.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Clear Errors.vi"/>
				<Item Name="Composition.lvlib" Type="Library" URL="/&lt;vilib&gt;/PNR/LabVIEW Composition/Composition/Composition.lvlib"/>
				<Item Name="Convert property node font to graphics font.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Convert property node font to graphics font.vi"/>
				<Item Name="Default Serialization Binder.lvclass" Type="LVClass" URL="/&lt;vilib&gt;/PNR/JSONtext Object Serialization/Default Serialization Binder/Default Serialization Binder.lvclass"/>
				<Item Name="Details Display Dialog.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Details Display Dialog.vi"/>
				<Item Name="DialogType.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/DialogType.ctl"/>
				<Item Name="DialogTypeEnum.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/DialogTypeEnum.ctl"/>
				<Item Name="Edit LVLibs.lvlib" Type="Library" URL="/&lt;vilib&gt;/Utility/EditLVLibs/Edit LVLibs.lvlib"/>
				<Item Name="Error Cluster From Error Code.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Error Cluster From Error Code.vi"/>
				<Item Name="Error Code Database.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Error Code Database.vi"/>
				<Item Name="ErrWarn.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/ErrWarn.ctl"/>
				<Item Name="eventsource.ctl" Type="VI" URL="/&lt;vilib&gt;/event_ctls.llb/eventsource.ctl"/>
				<Item Name="eventvkey.ctl" Type="VI" URL="/&lt;vilib&gt;/event_ctls.llb/eventvkey.ctl"/>
				<Item Name="Find Tag.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Find Tag.vi"/>
				<Item Name="Format Message String.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Format Message String.vi"/>
				<Item Name="General Error Handler Core CORE.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/General Error Handler Core CORE.vi"/>
				<Item Name="General Error Handler.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/General Error Handler.vi"/>
				<Item Name="Generic Object Serializer.lvclass" Type="LVClass" URL="/&lt;vilib&gt;/PNR/JSONtext Object Serialization/Generic Object Serializer/Generic Object Serializer.lvclass"/>
				<Item Name="Get LV Class Default Value By Name.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/LVClass/Get LV Class Default Value By Name.vi"/>
				<Item Name="Get LV Class Default Value.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/LVClass/Get LV Class Default Value.vi"/>
				<Item Name="Get LV Class Name.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/LVClass/Get LV Class Name.vi"/>
				<Item Name="Get String Text Bounds.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Get String Text Bounds.vi"/>
				<Item Name="Get Text Rect.vi" Type="VI" URL="/&lt;vilib&gt;/picture/picture.llb/Get Text Rect.vi"/>
				<Item Name="GetHelpDir.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/GetHelpDir.vi"/>
				<Item Name="GetNamedSemaphorePrefix.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/semaphor.llb/GetNamedSemaphorePrefix.vi"/>
				<Item Name="GetRTHostConnectedProp.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/GetRTHostConnectedProp.vi"/>
				<Item Name="JDP Timestamp.lvlib" Type="Library" URL="/&lt;vilib&gt;/JDP Science/JDP Science Common Utilities/Timestamp/JDP Timestamp.lvlib"/>
				<Item Name="JDP Utility.lvlib" Type="Library" URL="/&lt;vilib&gt;/JDP Science/JDP Science Common Utilities/JDP Utility.lvlib"/>
				<Item Name="JSONtext LVClass Serializer.lvclass" Type="LVClass" URL="/&lt;vilib&gt;/JDP Science/JSONtext/LVClass Serializer/JSONtext LVClass Serializer.lvclass"/>
				<Item Name="JSONtext.lvlib" Type="Library" URL="/&lt;vilib&gt;/JDP Science/JSONtext/JSONtext.lvlib"/>
				<Item Name="Longest Line Length in Pixels.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Longest Line Length in Pixels.vi"/>
				<Item Name="LVBoundsTypeDef.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/miscctls.llb/LVBoundsTypeDef.ctl"/>
				<Item Name="LVNumericRepresentation.ctl" Type="VI" URL="/&lt;vilib&gt;/numeric/LVNumericRepresentation.ctl"/>
				<Item Name="LVRectTypeDef.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/miscctls.llb/LVRectTypeDef.ctl"/>
				<Item Name="NI_Data Type.lvlib" Type="Library" URL="/&lt;vilib&gt;/Utility/Data Type/NI_Data Type.lvlib"/>
				<Item Name="NI_FileType.lvlib" Type="Library" URL="/&lt;vilib&gt;/Utility/lvfile.llb/NI_FileType.lvlib"/>
				<Item Name="Not A Semaphore.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/semaphor.llb/Not A Semaphore.vi"/>
				<Item Name="Not Found Dialog.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Not Found Dialog.vi"/>
				<Item Name="Obtain Semaphore Reference.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/semaphor.llb/Obtain Semaphore Reference.vi"/>
				<Item Name="Qualified Name Array To Single String.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/LVClass/Qualified Name Array To Single String.vi"/>
				<Item Name="Release Semaphore Reference.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/semaphor.llb/Release Semaphore Reference.vi"/>
				<Item Name="Release Semaphore.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/semaphor.llb/Release Semaphore.vi"/>
				<Item Name="RemoveNamedSemaphorePrefix.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/semaphor.llb/RemoveNamedSemaphorePrefix.vi"/>
				<Item Name="Search and Replace Pattern.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Search and Replace Pattern.vi"/>
				<Item Name="Semaphore RefNum" Type="VI" URL="/&lt;vilib&gt;/Utility/semaphor.llb/Semaphore RefNum"/>
				<Item Name="Semaphore Refnum Core.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/semaphor.llb/Semaphore Refnum Core.ctl"/>
				<Item Name="Serialization Binder.lvclass" Type="LVClass" URL="/&lt;vilib&gt;/PNR/JSONtext Object Serialization/Serialization Binder/Serialization Binder.lvclass"/>
				<Item Name="Set Bold Text.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Set Bold Text.vi"/>
				<Item Name="Set String Value.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Set String Value.vi"/>
				<Item Name="Single String To Qualified Name Array.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/LVClass/Single String To Qualified Name Array.vi"/>
				<Item Name="Space Constant.vi" Type="VI" URL="/&lt;vilib&gt;/dlg_ctls.llb/Space Constant.vi"/>
				<Item Name="TagReturnType.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/TagReturnType.ctl"/>
				<Item Name="TCP Get Raw Net Object.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/tcp.llb/TCP Get Raw Net Object.vi"/>
				<Item Name="Three Button Dialog CORE.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Three Button Dialog CORE.vi"/>
				<Item Name="Three Button Dialog.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Three Button Dialog.vi"/>
				<Item Name="Transparent Assertions.lvlib" Type="Library" URL="/&lt;vilib&gt;/PNR/Transparent Assertions/Transparent Assertions/Transparent Assertions.lvlib"/>
				<Item Name="Trim Whitespace.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Trim Whitespace.vi"/>
				<Item Name="Validate Semaphore Size.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/semaphor.llb/Validate Semaphore Size.vi"/>
				<Item Name="whitespace.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/whitespace.ctl"/>
			</Item>
			<Item Name="libc.so.6" Type="Document" URL="libc.so.6">
				<Property Name="NI.PreserveRelativePath" Type="Bool">true</Property>
			</Item>
			<Item Name="libcrypto-3-x64.dll" Type="Document" URL="../libssh2/libcrypto-3-x64.dll"/>
			<Item Name="libcrypto-3.dll" Type="Document" URL="../libssh2/libcrypto-3.dll"/>
			<Item Name="libssh2_64.dll" Type="Document" URL="../libssh2/libssh2_64.dll"/>
			<Item Name="libssl-3-x64.dll" Type="Document" URL="../libssh2/libssl-3-x64.dll"/>
			<Item Name="libssl-3.dll" Type="Document" URL="../libssh2/libssl-3.dll"/>
			<Item Name="lvssh2_extensions_64.dll" Type="Document" URL="../libssh2/lvssh2_extensions_64.dll"/>
			<Item Name="ws2_32.dll" Type="Document" URL="ws2_32.dll">
				<Property Name="NI.PreserveRelativePath" Type="Bool">true</Property>
			</Item>
		</Item>
		<Item Name="Build Specifications" Type="Build"/>
	</Item>
</Project>
