package sk.prasa.examples.albumskeleton.controller 
{
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	import sk.prasa.examples.albumskeleton.model.ApplicationProxy;
	import sk.prasa.examples.albumskeleton.model.ServiceProxy;
	import sk.prasa.examples.albumskeleton.model.vo.RequestVO;		
	
	/**
	 * @author Michal Gron (michal.gron@gmail.com)
	 * 
	 */
	public class ModelPrepCommand extends SimpleCommand implements ICommand 
	{
		override public function execute(notification : INotification) : void
		{
			var tRequestVO : RequestVO = new RequestVO();
				tRequestVO.userid = "thisispinkfu";
				tRequestVO.albumid = "5094406297232552993";
			
			facade.registerProxy(new ApplicationProxy(tRequestVO));
			facade.registerProxy(new ServiceProxy(ServiceProxy.NAME));
		}
	}
}
