package com.demo;

import com.wowza.wms.amf.*;
import com.wowza.wms.client.*;
import com.wowza.wms.module.*;
import com.wowza.wms.request.*;
import com.wowza.wms.stream.*;

public class ModuleInjectData extends ModuleBase {

	public void injectEvent(IClient client, RequestFunction function,
			AMFDataList params) {

		String streamname = params.getString(PARAM1);
		AMFDataObj question = params.getObject(PARAM2);
	
		IMediaStream stream = client.getAppInstance().getStreams()
			.getStream(streamname);
		if(stream != null) {
			System.out.println("event injected into " + streamname);
			stream.sendDirect("question", question);
		} else
			System.out.println("stream " + streamname + " wasn't found to inject into");
	}
}