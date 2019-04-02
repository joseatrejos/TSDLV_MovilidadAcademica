using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(_169075_BLANCO_CERVANTES_ANA_LUCIA.Startup))]
namespace _169075_BLANCO_CERVANTES_ANA_LUCIA
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
