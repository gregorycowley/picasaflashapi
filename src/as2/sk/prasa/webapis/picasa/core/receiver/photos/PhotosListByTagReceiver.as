import com.bourre.data.libs.XMLToObjectEvent;

import sk.prasa.webapis.picasa.events.PicasaEvent;
import sk.prasa.webapis.picasa.core.receiver.GetFeedReceiver;
import sk.prasa.webapis.picasa.core.receiver.IReceiver;

/**
 * @author Michal Gron (michal.gron@gmail.com)
 */

class sk.prasa.webapis.picasa.core.receiver.photos.PhotosListByTagReceiver extends GetFeedReceiver implements IReceiver 
{
	public function result(evt : XMLToObjectEvent) : Void
	{
		process(evt.getObject(), PicasaEvent.PHOTOS_GET_LIST_BY_TAG);
	}
}
