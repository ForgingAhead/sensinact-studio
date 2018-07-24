package org.eclipse.sensinact.studio.view.projectexplorer;

import org.eclipse.emf.common.util.URI;
import org.eclipse.emf.ecore.resource.Resource;
import org.eclipse.emf.ecore.xmi.impl.EcoreResourceFactoryImpl;
import org.eclipse.sensinact.studio.language.sensinact.DSL_SENSINACT;
import org.eclipse.sensinact.studio.view.projectexplorer.handler.SnaDeployHandler;
import org.junit.Test;
import org.junit.Assert;
/**
 *@author Feng Chen
 */
public class SnaDeployHandlerTest {
	
	@Test
	public void test() {
		Resource.Factory.Registry.INSTANCE.getExtensionToFactoryMap().put("sna", new EcoreResourceFactoryImpl ());
		URI snaFileURI = URI.createFileURI("lightControl.sna");
		
		DSL_SENSINACT sna = SnaDeployHandler.fileURI2eca(snaFileURI);
		System.out.println("resource 1: " + sna.getResources().get(0).getName());
		Assert.assertEquals(3, sna.getResources().size());
	}

}
