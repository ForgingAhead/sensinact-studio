/**
 * Copyright (c) 2018 CEA.
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 *  Contributors:
 *     CEA - initial API and implementation and/or initial documentation
 */
/*
 * generated by Xtext 2.9.1
 */
package org.eclipse.sensinact.studio.language.scoping

import org.eclipse.emf.ecore.EObject
import org.eclipse.emf.ecore.EReference
import org.eclipse.xtext.scoping.impl.FilteringScope
import org.eclipse.xtext.resource.IEObjectDescription
import com.google.common.base.Predicate
import org.eclipse.sensinact.studio.language.sensinact.DSL_SENSINACT

/**
 * Filer elements to "stay" in the current file. 
 *
 * See https://www.eclipse.org/Xtext/documentation/303_runtime_concepts.html#scoping
 * on how and when to use it.
 */
class SensinactScopeProvider extends AbstractSensinactScopeProvider {

	override getScope(EObject context, EReference reference) {
		return new FilteringScope(super.getScope(context, reference), new Predicate<IEObjectDescription>() {
			override apply(IEObjectDescription input) {
				var curECA = getEca(input.EObjectOrProxy);
				var contextEca = getEca(context);
				return curECA == contextEca;
			}
		});
	}
	
	def DSL_SENSINACT getEca(EObject object) {
		if (object === null)
			return null;
		if (object instanceof DSL_SENSINACT)
			return object as DSL_SENSINACT;
		return getEca(object.eContainer);
	}
}
