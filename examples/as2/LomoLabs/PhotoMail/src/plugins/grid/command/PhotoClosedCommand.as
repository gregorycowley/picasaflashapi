/**
 * @author michal.gron@gmail.com
 */

import com.bourre.ioc.control.AbstractCommand;

import plugins.grid.control.PhotoClosedEvent;
import plugins.grid.model.*;

class plugins.grid.command.PhotoClosedCommand extends AbstractCommand
{
	private var __model:GridModel;
	
	public function execute(evt:PhotoClosedEvent)
	{
		__model = GridModel(getModelLocator().getModel(ModelList.GRID_MODEL));
		__model.notifyChanged(evt);
	}
}