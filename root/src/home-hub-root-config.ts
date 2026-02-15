import { registerApplication, start, LifeCycles } from "single-spa";

registerApplication({
  name: "@home-hub/react-navbar",
  app: () =>
    import(
      /* webpackIgnore: true */ // @ts-ignore-next
      "@home-hub/react-navbar"
    ),
  activeWhen: (location) => location.pathname === "/",
});

start({
  urlRerouteOnly: true,
});
