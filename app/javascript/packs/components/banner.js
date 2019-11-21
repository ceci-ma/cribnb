import Typed from 'typed.js';


const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Book unique cribs", "Live unique experiences"],
    contentType: 'text',
    typeSpeed: 70,
    loop: true
  });
}


export { loadDynamicBannerText };
