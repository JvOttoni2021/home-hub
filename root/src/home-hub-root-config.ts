import { registerApplication, start, LifeCycles } from "single-spa";

registerApplication({
  name: "@home-hub/hello-world",
  app: () =>
    import(
      /* webpackIgnore: true */ // @ts-ignore-next
      "@home-hub/hello-world"
    ),
  activeWhen: ["/"],
});

registerApplication({
  name: "@home-hub/react-navbar",
  app: () =>
    import(
      /* webpackIgnore: true */ // @ts-ignore-next
      "@home-hub/react-navbar"
    ),
  activeWhen: ["/"],
});

start({
  urlRerouteOnly: true,
});
